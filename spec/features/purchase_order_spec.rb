require 'rails_helper'


describe PurchaseOrder do
  before(:each) do
    sign_in
  end

  describe "create" do
    it "creates a new purchase order" do
      @purchase_order = add_one_purchase_order
      expect(current_path).to eq purchase_order_path(@purchase_order)
      visit purchase_order_path(@purchase_order)
    end
  end

  describe "Purchase Items" do
    before(:each) do
      @purchase_order = add_one_purchase_order
      visit purchase_order_path(@purchase_order)
    end

    it "can add a new purchase item", js: true do

      click_add_purchase_item_button

      within "div.items_section" do

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

    it "autocompletes with pre-filled values for the purchase item", js: true do
      @purchase_order.purchase_items.create!(item_name: 'Coke', unit: 'pcs', quantity: '5', price: '20')
      visit purchase_order_path(@purchase_order)
      
      click_add_purchase_item_button

      #
      #After Coke as been added, autocomplete should work
      #and the default values should be pre-filled
      #
      fill_autocomplete 'purchase_item_item_name', with: 'Cok'
      sleep 1
      within "div.items_section" do
        click_on 'Add'
        expect(page).to have_content 'Grand Total: 200.00'
      end
    end

  end

  # describe "Delivery" do
  #   before(:each) do
  #     @purchase_order = add_one_purchase_order
  #     visit purchase_order_path(@purchase_order)
  #   end
  # end

end

def click_add_purchase_item_button
  within "div.items_section" do
    click_on 'Add'
    expect(page).to have_selector('#purchase_item_item_name', visible: true)
  end
end

