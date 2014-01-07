require 'test_helper'

class PurchaseItemTest < ActiveSupport::TestCase
  test "Adding Purchase Item to Purchase Order" do
     goma1 = items(:one)

     po = PurchaseOrder.new(supplier_name: "Greko", phones_attributes: [number: "123456"], purchase_order_contacts_attributes: [name: "Christy"])

     po.items << goma1

     po.save!

     retreived_po = PurchaseOrder.find(po)
     assert retreived_po.items.size == 1
     assert retreived_po.purchase_items.size == 1
  end

  test "Adding Purchase Item via Purchase Order nested Items attributes" do
     goma1 = items(:one)

     po = PurchaseOrder.new(supplier_name: "Greko", phones_attributes: [number: "123456"], 
     	purchase_order_contacts_attributes: [name: "Christy"],
     	purchase_items_attributes: [item: goma1, price: 100.00])
     po.save!

     retreived_po = PurchaseOrder.find(po)
     retreived_po.purchase_items.each {|item| puts item }

  end
end
