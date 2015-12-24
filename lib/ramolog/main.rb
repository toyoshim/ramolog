require 'mongo'
require 'time'

module Ramolog
  class Logger
    def initialize(app, uri, collection)
      @app = app
      @db = Mongo::Client.new(uri)
      @collection = @db[collection]
    end

    def call(env)
      begin_at = Time.now
      status, header, body = @app.call(env)
      end_at = Time.now

      # Retrieve the original remote host if running behind a front end.
      remote_addr = env['REMOTE_ADDR'] or '-'
      if forwarded = env['HTTP_X_FORWARDED_FOR'] then
        remote_addr = forwarded.split(',')[-1]
      end

      @collection.insert_one({
        format: 1,
        date: begin_at.iso8601,
        referrer: (env['HTTP_REFFERER'] or '-'),
        request: {
          method: env['REQUEST_METHOD'],
          host: (env['HTTP_HOST'] or '-'),
          url: env['REQUEST_URI'],
          protocol: env['HTTP_VERSION'],
          acceptLanguage: (env['HTTP_ACCEPT_LANGUAGE'] or '-')
        },
        response: {
          status: status,
          contentLength: (header['Content-Length'] or '-1').to_i,
          responseTime: (end_at - begin_at) * 1000  # msec
        },
        remote: {
          addr: remote_addr,
          user: (env['REMOTE_USER'] or '-'),
          userAgent: (env['HTTP_USER_AGENT'] or '-')
        }
      })
      [status, header, body]
    end
  end
end
