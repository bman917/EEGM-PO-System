class CreatePurchaseOrders < ActiveRecord::Migration
  def change
    create_table :purchase_orders do |t|
      t.references :supplier, index: true
      t.text :notes
	  t.date :po_date
	  t.float :grand_total
      t.timestamps
    end
  end
end
