class CreateSupplierItems < ActiveRecord::Migration
  def change
    create_table :supplier_items do |t|
      t.references :supplier, index: true
      t.references :item, index: true
      t.float :price
      t.text :note

      t.timestamps
    end
  end
end
