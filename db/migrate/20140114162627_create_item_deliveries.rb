class CreateItemDeliveries < ActiveRecord::Migration
  def change
    create_table :item_deliveries do |t|
      t.references :item, index: true
      t.references :purchase_order, index: true
      t.integer :quantity
      t.string :unit
      t.datetime :date_recieved

      t.timestamps
    end
  end
end
