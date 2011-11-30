require 'test_helper'

class PageTest < ActiveSupport::TestCase
  test "should get attributes" do
    page = Page.new(:title => 'Test title', :url => 'http://dummy.co.jp', :type => 'HTML', :host => 'dummy.co.jp', :workshop_id => 1, :log_id => 1)
    assert_equal 'Test title', page.title
    assert_equal 'http://dummy.co.jp', page.url
    assert_equal 'HTML', page.type
    assert_equal 'dummy.co.jp', page.host
    assert_equal 1, page.workshop_id
    assert_equal 1, page.log_id
  end
end
