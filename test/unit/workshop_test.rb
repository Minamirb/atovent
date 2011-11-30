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
end
