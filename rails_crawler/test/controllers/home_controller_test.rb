require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get crawler" do
    get home_crawler_url
    assert_response :success
  end

end
