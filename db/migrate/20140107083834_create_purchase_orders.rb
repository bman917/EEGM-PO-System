class CreatePurchaseOrders < ActiveRecord::Migration
  def change
    create_table :purchase_orders do |t|
      t.references :supplier, index: true
      t.text :notes

      t.timestamps
    end
  end
end
