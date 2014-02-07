class AddStatusToPurchaseOrders < ActiveRecord::Migration
  def change
    add_column :purchase_orders, :status, :string
  end
end
