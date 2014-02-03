require 'test_helper'

class PurchaseOrderContactsControllerTest < ActionController::TestCase

  setup do
    @purchase_order_contact = purchase_order_contacts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create purchase_order_contact" do
    get :create, purchase_order_contact: { 
      purchase_order_id: @purchase_order_contact.purchase_order.id,
      name: @purchase_order_contact.name
    }
    assert_response :success
  end

  test "should get destroy" do
    assert_difference('PurchaseOrderContact.count', -1) do
      delete :destroy, id: @purchase_order_contact
    end

    assert_response :success
  end

  test "should get update" do
    get :update
    assert_response :success
  end

end
