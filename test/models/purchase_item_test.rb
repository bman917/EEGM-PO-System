require 'test_helper'

class PurchaseItemTest < ActiveSupport::TestCase

  test "Case where PurchaseItem.last_item returns someting" do
    PurchaseItem.destroy_all
    Item.destroy_all
    
    po = PurchaseOrder.new(supplier_name: 'Jolibee')
    po.save!

    pi = PurchaseItem.new(item_name: 'Burger', price: 100, quantity: 1, purchase_order: po)
    pi.save!

    item = Item.find_by(name: 'Burger')

    assert_not_nil PurchaseItem.last_item(item)
    assert PurchaseItem.has?(item), "PurchaseItem should have #{item.name}"
  end

  test "Case where PurchaseItem.last_item returns nil" do
    PurchaseItem.destroy_all
    Item.destroy_all

    item = Item.new(name: 'Burger')
    item.save!

    assert_nil PurchaseItem.last_item(item)
    assert_nil item.last_pi
  end

  test "Do note save Purchase Items with blank names" do
    pi = PurchaseItem.new
    assert !pi.save, "Do note save Purchase Items with blank names"
  end

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

  test "Updating Purchase Item Price Recalculates totals" do

    po = purchase_orders(:one)

    po_item = po.purchase_items.first
    po_item.quantity = 20
    po_item.price = 100

    assert po_item.total == 2000, "Purchase Item Price has incorrect total"
    po_item.save!

    po.reload
    assert po.grand_total == 2000, "When Purchase Item is updated, PO grand total should also be updated"
  end

  test "Setting Wrong Total is not followed" do

    po = purchase_orders(:one)

    po_item = po.purchase_items.first
    po_item.quantity = 20
    po_item.price = 100
    po_item.total = 0

    assert po_item.total == 2000, "Purchase Item Price has incorrect total"
    po_item.save!

    po.reload
    assert po.grand_total == 2000, "When Purchase Item is updated, PO grand total should also be updated"
  end

  test "Deleting Purchase Item Recalculates PO grand total" do
    po = purchase_orders(:one)
    po_item = po.purchase_items.first
    po_item.quantity = 20
    po_item.price = 100
    po_item.save!
    po.reload
    puts "Before destroying Purchase Item PO grand total is #{po.grand_total}"
    po.purchase_items.first.destroy
    po.reload
    assert po.grand_total == 0, "When Purchase Item is delete, PO grand total should also be updated"    

  end

end
