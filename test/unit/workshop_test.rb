require 'test_helper'

class WorkshopTest < ActiveSupport::TestCase
  test "add delayed job after create" do
    hashtag = '#railshackathon'
    assert_difference "Delayed::Job.count", +1 do
      Workshop.create(:hashtag => hashtag)
    end
    assert_match /#{hashtag}/, Delayed::Job.first.handler
  end
end
