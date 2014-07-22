def add_one_purchase_order
  PurchaseOrder.destroy_all
  visit purchase_orders_path
  fill_in 'purchase_order_supplier_name', with: 'JD Food Hall'
  click_button 'Create'
  expect(page).to have_content 'JD Food Hall'
  expect(page).to have_content 'Purchase Order #'
  expect(page).to have_content 'PENDING'
  expect(PurchaseOrder.count).to eq 1
  PurchaseOrder.first
end