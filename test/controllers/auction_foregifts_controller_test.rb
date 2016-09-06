require 'test_helper'

class AuctionForegiftsControllerTest < ActionController::TestCase
  setup do
    @auction_foregift = auction_foregifts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:auction_foregifts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create auction_foregift" do
    assert_difference('AuctionForegift.count') do
      post :create, auction_foregift: { amount: @auction_foregift.amount, auction_id: @auction_foregift.auction_id, payment_method_id: @auction_foregift.payment_method_id, state: @auction_foregift.state }
    end

    assert_redirected_to auction_foregift_path(assigns(:auction_foregift))
  end

  test "should show auction_foregift" do
    get :show, id: @auction_foregift
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @auction_foregift
    assert_response :success
  end

  test "should update auction_foregift" do
    patch :update, id: @auction_foregift, auction_foregift: { amount: @auction_foregift.amount, auction_id: @auction_foregift.auction_id, payment_method_id: @auction_foregift.payment_method_id, state: @auction_foregift.state }
    assert_redirected_to auction_foregift_path(assigns(:auction_foregift))
  end

  test "should destroy auction_foregift" do
    assert_difference('AuctionForegift.count', -1) do
      delete :destroy, id: @auction_foregift
    end

    assert_redirected_to auction_foregifts_path
  end
end
