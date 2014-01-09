class AddUnitToPurchaseItem < ActiveRecord::Migration
  def change
    add_column :purchase_items, :unit, :string
  end
end
