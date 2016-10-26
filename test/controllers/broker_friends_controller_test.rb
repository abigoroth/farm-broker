require 'test_helper'

class BrokerFriendsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @broker_friend = broker_friends(:one)
  end

  test "should get index" do
    get broker_friends_url
    assert_response :success
  end

  test "should get new" do
    get new_broker_friend_url
    assert_response :success
  end

  test "should create broker_friend" do
    assert_difference('BrokerFriend.count') do
      post broker_friends_url, params: { broker_friend: {  } }
    end

    assert_redirected_to broker_friend_url(BrokerFriend.last)
  end

  test "should show broker_friend" do
    get broker_friend_url(@broker_friend)
    assert_response :success
  end

  test "should get edit" do
    get edit_broker_friend_url(@broker_friend)
    assert_response :success
  end

  test "should update broker_friend" do
    patch broker_friend_url(@broker_friend), params: { broker_friend: {  } }
    assert_redirected_to broker_friend_url(@broker_friend)
  end

  test "should destroy broker_friend" do
    assert_difference('BrokerFriend.count', -1) do
      delete broker_friend_url(@broker_friend)
    end

    assert_redirected_to broker_friends_url
  end
end
