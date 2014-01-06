require 'test_helper'

class SupplierItemsControllerTest < ActionController::TestCase
  setup do
    @supplier_item = supplier_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:supplier_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create supplier_item" do
    assert_difference('SupplierItem.count') do
      post :create, supplier_item: { item_id: @supplier_item.item_id, note: @supplier_item.note, price: @supplier_item.price, supplier_id: @supplier_item.supplier_id }
    end

    assert_redirected_to supplier_item_path(assigns(:supplier_item))
  end

  test "should show supplier_item" do
    get :show, id: @supplier_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @supplier_item
    assert_response :success
  end

  test "should update supplier_item" do
    patch :update, id: @supplier_item, supplier_item: { item_id: @supplier_item.item_id, note: @supplier_item.note, price: @supplier_item.price, supplier_id: @supplier_item.supplier_id }
    assert_redirected_to supplier_item_path(assigns(:supplier_item))
  end

  test "should destroy supplier_item" do
    assert_difference('SupplierItem.count', -1) do
      delete :destroy, id: @supplier_item
    end

    assert_redirected_to supplier_items_path
  end
end
