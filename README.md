# RateLimitProxy

This gem is useful to rate limit any arbitrary object. This can be useful for network APIs where you don't want to flood
the API with requests.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rate_limit_proxy'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rate_limit_proxy

## Usage

For example, given network API object 'api', to rate limit no more than 30 calls in 60 seconds:

```ruby
api = API.new
rate_limited_api = RateLimitProxy.new(api, 30, 60)
```

rate_limited_api will proxy all method calls and make sure the underlying methods are not called more frequently
than you specified

## Caveats

This is mostly useful on a Ruby interpreter with Real Threads. (Rubinious, JRuby)

## Contributing

1. Fork it ( https://github.com/jhstatewide/rate_limit_proxy/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
