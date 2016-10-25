require 'test_helper'

class UserViewsControllerTest < ActionDispatch::IntegrationTest
  test "should get profile" do
    get user_views_profile_url
    assert_response :success
  end

end
