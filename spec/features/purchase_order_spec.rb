require 'rails_helper'


describe PurchaseOrder do
  before(:each) do
    sign_in
  end

  describe "create", js: true do
    it "adds a new PurchaseOrder" do

      visit purchase_orders_path
      fill_in 'purchase_order_supplier_name', with: 'JD Food Hall'
      click_button 'Create'
      expect(page).to have_content 'JD Food Hall'
      expect(page).to have_content 'Purchase Order #'
      expect(page).to have_content 'PENDING'
      expect(PurchaseOrder.count).to eq 1

      within "div.items_section" do
        click_on 'Add'
        expect(page).to have_selector('#purchase_item_item_name', visible: true)

        fill_in 'purchase_item_item_name', with: 'Coke'
        fill_in 'purchase_item_quantity', with: '5'
        fill_in 'purchase_item_unit', with: 'pcs'
        fill_in 'purchase_item_price', with: '20'
        fill_in 'purchase_item_note', with: 'Ice Cold'
        click_on 'Add'

        expect(page).to have_content 'Grand Total: 100.00'

        expect(find_field('purchase_item_item_name').value).to eq ''

        expect(page).to have_content 'Coke'


      end

    end
  end
end