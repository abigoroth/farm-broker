require 'test_helper'

class BidProcessesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bid_process = bid_processes(:one)
  end

  test "should get index" do
    get bid_processes_url
    assert_response :success
  end

  test "should get new" do
    get new_bid_process_url
    assert_response :success
  end

  test "should create bid_process" do
    assert_difference('BidProcess.count') do
      post bid_processes_url, params: { bid_process: { bidding_time: @bid_process.bidding_time, price: @bid_process.price } }
    end

    assert_redirected_to bid_process_url(BidProcess.last)
  end

  test "should show bid_process" do
    get bid_process_url(@bid_process)
    assert_response :success
  end

  test "should get edit" do
    get edit_bid_process_url(@bid_process)
    assert_response :success
  end

  test "should update bid_process" do
    patch bid_process_url(@bid_process), params: { bid_process: { bidding_time: @bid_process.bidding_time, price: @bid_process.price } }
    assert_redirected_to bid_process_url(@bid_process)
  end

  test "should destroy bid_process" do
    assert_difference('BidProcess.count', -1) do
      delete bid_process_url(@bid_process)
    end

    assert_redirected_to bid_processes_url
  end
end
