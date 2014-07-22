require 'rails_helper'
require 'purchase_order_helper'

describe 'PurchaseOrderContact'  do
  before(:each) do
    sign_in
  end


  describe "Persons" do
    before(:each) do
      @purchase_order = add_one_purchase_order
      visit purchase_order_path(@purchase_order)
    end

    it "can show and hide contact persons", js: true do
      within "#contact_persons" do
        click_on 'Add'
        expect(page).to have_selector('#purchase_order_contact_name', visible: true)
        click_on 'Hide'
        expect(page).to have_selector('#purchase_order_contact_name', visible: false)
      end
    end

    it "can add and delete contact persons", js: true do
       within "#contact_persons" do
        click_on 'Add'
        fill_in 'purchase_order_contact_name', with: 'Juan Dela Cruz'
        click_on 'Add'
        expect(page).to have_selector('#purchase_order_contact_name', visible: false)
        expect(page).to have_content 'Juan Dela Cruz'

        click_link 'X'
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_no_content('Juan Dela Cruz')
      end
    end

  end

  describe "Numbers" do
    before(:each) do
      @purchase_order = add_one_purchase_order
      visit purchase_order_path(@purchase_order)
    end
    
    it "can add and delete contact numbers", js: true do
      within "#contact_numbers" do
        click_on 'Add'
        expect(page).to have_selector('#phone_number', visible: true)
        fill_in 'phone_number', with: '1234567'
        click_on 'Add'
        expect(page).to have_content('123-4567')

        click_link 'X'
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_no_content('123-4567')
      end
    end

    it "can show and hide contact numbers", js: true do
      within "#contact_numbers" do
        click_on 'Add'
        expect(page).to have_selector('#phone_number', visible: true)
        click_on 'Hide'
        expect(page).to have_selector('#phone_number', visible: false)
      end
    end
  end
  
end