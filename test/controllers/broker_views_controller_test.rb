require 'test_helper'

class BrokerViewsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get broker_views_index_url
    assert_response :success
  end

end
