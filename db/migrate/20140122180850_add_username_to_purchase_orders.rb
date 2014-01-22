class AddUsernameToPurchaseOrders < ActiveRecord::Migration
  def change
    add_column :purchase_orders, :username, :string
  end
end
