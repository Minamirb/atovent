require 'test_helper'

class WorkshopTest < ActiveSupport::TestCase
  test "has_many logs" do
    assert_equal :has_many, Workshop.reflect_on_association(:logs).macro
  end

  test "add delayed job after create" do
    hashtag = '#railshackathon'
    assert_difference "Delayed::Job.count", +1 do
      Workshop.create(:hashtag => hashtag)
    end
    assert_match /#{hashtag}/, Delayed::Job.first.handler
  end

  test "#extract_tweets" do
    hashtag = '#minamirb'
    url = Atovent::Twitter.new.instance_variable_get(:@search_host) + "/search.json?q=#{URI.encode(hashtag)}"
    stub_request(:get, url).to_return(:body => fixture_text('minamirb_tweets'))
    workshop = Workshop.create(:hashtag => hashtag)
    assert_difference 'Log.count', +15 do
      Delayed::Worker.new.run(Delayed::Job.last)
    end
    last_log = Log.last
    assert last_log.user_screen_name.length > 0
    assert_equal workshop.id, last_log.workshop.id
  end

end
