require 'rspec'
require './lib/rate_limit_proxy'

class APISimulation
  def hello
    sleep 2
  end

  def goodbye
    sleep 2
  end

  def wink
    sleep 2
  end
end

describe 'RateLimitProxy' do
  it 'should be able to rate limit an object...' do
    api = RateLimitProxy.new(APISimulation.new, 10, 30)
    before_time = Time.now
    10.times do
      api.hello
      api.wink
      api.goodbye
    end
    after_time = Time.now
    rate_limited_time = (after_time.to_i - before_time.to_i)
    before_time = Time.now
    api = APISimulation.new
    10.times do
      api.hello
      api.wink
      api.goodbye
    end
    after_time = Time.now
    raw_time = (after_time.to_i - before_time.to_i)
    expect(raw_time).to be < rate_limited_time
  end
end
