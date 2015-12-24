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

# For other languages

- Express / Node.js: [momolog](https://github.com/toyoshim/momolog)
