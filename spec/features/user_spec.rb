require 'rails_helper'


describe "Users" do
  before(:each) do
    create_admin
  end

  describe "signin process" do

    it "signs min" do
      visit new_user_session_path
      fill_in 'user_username', :with => 'admin'
      fill_in 'user_password', :with => 'password'
      click_button 'Sign in'
      expect(current_path).to eq root_path
    end
  end
end