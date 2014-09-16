require 'glutton_ratelimit'

class RateLimitProxy

  VERSION = '0.0.1'

  def initialize(rate_limited_object, number_of_calls, in_seconds)
    @_RATE_LIMITED_OBJECT = rate_limited_object
    @_RATE_LIMITER = GluttonRatelimit::BurstyTokenBucket.new number_of_calls, in_seconds
  end

  def method_missing(meth, *args, &block)
    @_RATE_LIMITER.times(1) do
      @_RATE_LIMITED_OBJECT.send(meth, *args, &block)
    end
  end
end
