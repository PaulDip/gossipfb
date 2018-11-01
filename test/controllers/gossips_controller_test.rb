require 'test_helper'

class GossipsControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    @gossip = gossips(:one)
  end

  test "should get index" do
    get :index, params: { user_id: @user }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { user_id: @user }
    assert_response :success
  end

  test "should create gossip" do
    assert_difference('Gossip.count') do
      post :create, params: { user_id: @user, gossip: @gossip.attributes }
    end

    assert_redirected_to user_gossip_path(@user, Gossip.last)
  end

  test "should show gossip" do
    get :show, params: { user_id: @user, id: @gossip }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { user_id: @user, id: @gossip }
    assert_response :success
  end

  test "should update gossip" do
    put :update, params: { user_id: @user, id: @gossip, gossip: @gossip.attributes }
    assert_redirected_to user_gossip_path(@user, Gossip.last)
  end

  test "should destroy gossip" do
    assert_difference('Gossip.count', -1) do
      delete :destroy, params: { user_id: @user, id: @gossip }
    end

    assert_redirected_to user_gossips_path(@user)
  end
end
