require 'test_helper'

class LogTest < ActiveSupport::TestCase
  setup do
    @workshop = workshops(:one)
  end

  test "belongs_to workshop" do
    assert_equal :belongs_to, Log.reflect_on_association(:workshop).macro
  end

  test ".extract_tweets" do
    url = Twitter.new.instance_variable_get(:@search_host) + '/search.json?q=%23minamirb'
    stub_request(:get, url).to_return(:body => fixture_text('minamirb_tweets'))
    assert_difference 'Log.count', +15 do
      Log.extract_tweets("#minamirb", @workshop.id)
      Delayed::Worker.new.run(Delayed::Job.last)
    end
    last_log = Log.last
    assert last_log.user_screen_name.length > 0
    assert_equal @workshop.id, last_log.workshop.id
  end
end
