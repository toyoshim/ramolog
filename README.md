# Ramolog

MongoDB backed Rack's CommonLogger replacement.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ramolog'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ramolog

## Usage

*app.rb*
```node
require 'sinatra'

configure do
  use Ramolog::Logger, ENV['MONGOLAB_URI'], 'log'
end
```

## Log format example
```json
{
    "_id": {
        "$oid": "567b9cc2295d3b000300001d"
    },
    "format": 1,
    "date": "2015-12-24T07:20:34+00:00",
    "referrer": "-",
    "request": {
        "method": "GET",
        "host": "www.toyoshima-house.net",
        "url": "http://www.toyoshima-house.net/index.html",
        "protocol": "HTTP/1.1",
        "acceptLanguage": "zh-cn,zh-tw"
    },
    "response": {
        "status": 200,
        "contentLength": 105,
        "responseTime": 0.408114
    },
    "remote": {
        "addr": "*.*.*.*",
        "user": "-",
        "userAgent": "Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)"
    }
}
```

## For other languages

- Express / Node.js: [momolog](https://github.com/toyoshim/momolog)
- http / Golang: [gomolog](https://github.com/toyoshim/gomolog)