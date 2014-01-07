class CreatePurchaseOrderContacts < ActiveRecord::Migration
  def change
    create_table :purchase_order_contacts do |t|
      t.references :purchase_order, index: true
      t.string :name

      t.timestamps
    end
  end
end
