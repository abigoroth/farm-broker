require 'test_helper'

class BidderViewsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bidder_views_index_url
    assert_response :success
  end

end
