require 'test_helper'

class LogTest < ActiveSupport::TestCase
  test ".extract_tweets" do
    url = Twitter.new.instance_variable_get(:@search_host) + '/search.json?q=%23minamirb'
    stub_request(:get, url).to_return(:body => fixture_text('minamirb_tweets'))
    assert_difference 'Log.count', +15 do
      Log.extract_tweets("#minamirb")
      Delayed::Worker.new.run(Delayed::Job.last)
    end
    assert Log.last.user_screen_name.length > 0
  end
end
