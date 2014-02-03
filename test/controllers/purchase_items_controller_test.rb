require 'test_helper'

class PurchaseItemsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    post :create, purchase_item: {item_name: 'Goma One', quantity: 1, unit: 'Pairs', price: 77.77, purchase_order_id: 1}
    assert_response :success
  end

  test "should get destroy" do
    assert_difference('PurchaseItem.count', -1) do
      delete :destroy, id: 1
    end

    assert_response :success
  end

  test "should get update" do
    patch :update, id: 1, purchase_item: {item_name: 'Goma One', quantity: 1, unit: 'Pairs', price: 77.77}
    assert_redirected_to purchase_order_path(assigns(:purchase_item).purchase_order)
  end

end
