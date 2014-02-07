class AddStatusToPurchaseOrders < ActiveRecord::Migration
  def change
    add_column :purchase_orders, :status, :string, default: 'PENDING'

  end
end
