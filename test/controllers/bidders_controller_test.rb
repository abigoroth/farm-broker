require 'test_helper'

class BiddersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bidder = bidders(:one)
  end

  test "should get index" do
    get bidders_url
    assert_response :success
  end

  test "should get new" do
    get new_bidder_url
    assert_response :success
  end

  test "should create bidder" do
    assert_difference('Bidder.count') do
      post bidders_url, params: { bidder: { address: @bidder.address, credit_card: @bidder.credit_card, dob: @bidder.dob, name: @bidder.name, phone: @bidder.phone } }
    end

    assert_redirected_to bidder_url(Bidder.last)
  end

  test "should show bidder" do
    get bidder_url(@bidder)
    assert_response :success
  end

  test "should get edit" do
    get edit_bidder_url(@bidder)
    assert_response :success
  end

  test "should update bidder" do
    patch bidder_url(@bidder), params: { bidder: { address: @bidder.address, credit_card: @bidder.credit_card, dob: @bidder.dob, name: @bidder.name, phone: @bidder.phone } }
    assert_redirected_to bidder_url(@bidder)
  end

  test "should destroy bidder" do
    assert_difference('Bidder.count', -1) do
      delete bidder_url(@bidder)
    end

    assert_redirected_to bidders_url
  end
end
