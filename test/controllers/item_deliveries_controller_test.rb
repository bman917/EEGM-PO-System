require 'test_helper'

class ItemDeliveriesControllerTest < ActionController::TestCase
  setup do
    @item_delivery = item_deliveries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:item_deliveries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item_delivery" do
    assert_difference('ItemDelivery.count') do
      post :create, item_delivery: { date_recieved: @item_delivery.date_recieved, item_id: @item_delivery.item_id, purchase_order_id: @item_delivery.purchase_order_id, quantity: @item_delivery.quantity, unit: @item_delivery.unit }
    end

    assert_redirected_to purchase_order_path(assigns(:item_delivery).purchase_order)
  end

  test "should show item_delivery" do
    get :show, id: @item_delivery
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item_delivery
    assert_response :success
  end

  test "should update item_delivery" do
    patch :update, id: @item_delivery, item_delivery: { date_recieved: @item_delivery.date_recieved, item_id: @item_delivery.item_id, purchase_order_id: @item_delivery.purchase_order_id, quantity: @item_delivery.quantity, unit: @item_delivery.unit }
    assert_redirected_to item_delivery_path(assigns(:item_delivery))
  end

  test "should destroy item_delivery" do
    assert_difference('ItemDelivery.count', -1) do
      delete :destroy, id: @item_delivery
    end

    assert_redirected_to purchase_order_path(assigns(:item_delivery).purchase_order)
  end
end
