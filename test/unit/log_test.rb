require 'test_helper'

class LogTest < ActiveSupport::TestCase
  setup do
    @workshop = workshops(:one)
  end

  test "belongs_to workshop" do
    assert_equal :belongs_to, Log.reflect_on_association(:workshop).macro
  end
end
