class CreateSuppliers < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.string :name
      t.text :notes
      t.references :contact_detail, polymorphic: true
      t.timestamps
    end
  end
end
