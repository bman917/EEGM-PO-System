require 'test_helper'

class PurchaseOrderTest < ActiveSupport::TestCase
  test "When PO is deleted, it's Purchase Items are also deleted" do
    po = purchase_orders(:one)
    po_item = po.purchase_items.first

    po.destroy!

    assert PurchaseItem.exists?(po_item.id) == false
  end

  test "When PO is deleted, it's Phones should also be deleted" do
    po = purchase_orders(:one)
    phone = po.phones.first

    po.destroy!

    assert Phone.exists?(phone.id) == false
  end

  test "When PO is deleted, the related Item should not be deleted" do
    po = purchase_orders(:one)
    item = po.items.first

    po.destroy!

    assert Item.exists?(item.id) == true
  end

  test "Couting of delivery items" do
    po = PurchaseOrder.new(supplier_name: 'Jolibee')
    po.save!

    yum = po.purchase_items.create(item_name: 'Yum', price: '100', quantity: '10')

    puts "#{yum.to_s} - #{yum.total}"

    d1 = po.item_deliveries.create(item_name: 'Yum', quantity: 10)
    d2 = po.item_deliveries.create(item_name: 'Yum', quantity: 10)

    assert po.count_delivery_item(yum) == 20, "There should be 20 yum deliveries."
  end
end
