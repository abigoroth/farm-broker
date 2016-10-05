require 'test_helper'

class FarmsitesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @farmsite = farmsites(:one)
  end

  test "should get index" do
    get farmsites_url
    assert_response :success
  end

  test "should get new" do
    get new_farmsite_url
    assert_response :success
  end

  test "should create farmsite" do
    assert_difference('Farmsite.count') do
      post farmsites_url, params: { farmsite: { brokerid: @farmsite.brokerid, districtid: @farmsite.districtid, farmsiteaddress: @farmsite.farmsiteaddress, farmsitename: @farmsite.farmsitename, farmsiteownername: @farmsite.farmsiteownername, farmsiteownerphoneno: @farmsite.farmsiteownerphoneno, farmsitesize: @farmsite.farmsitesize } }
    end

    assert_redirected_to farmsite_url(Farmsite.last)
  end

  test "should show farmsite" do
    get farmsite_url(@farmsite)
    assert_response :success
  end

  test "should get edit" do
    get edit_farmsite_url(@farmsite)
    assert_response :success
  end

  test "should update farmsite" do
    patch farmsite_url(@farmsite), params: { farmsite: { brokerid: @farmsite.brokerid, districtid: @farmsite.districtid, farmsiteaddress: @farmsite.farmsiteaddress, farmsitename: @farmsite.farmsitename, farmsiteownername: @farmsite.farmsiteownername, farmsiteownerphoneno: @farmsite.farmsiteownerphoneno, farmsitesize: @farmsite.farmsitesize } }
    assert_redirected_to farmsite_url(@farmsite)
  end

  test "should destroy farmsite" do
    assert_difference('Farmsite.count', -1) do
      delete farmsite_url(@farmsite)
    end

    assert_redirected_to farmsites_url
  end
end
