class Supplier < ActiveRecord::Base
  has_many :phones, as: :contact_detail
  accepts_nested_attributes_for :phones, allow_destroy: true  
  has_many :purchase_orders
  has_many :purchase_items, through: :purchase_orders
  has_many :supplier_items
  has_many :items, through: :supplier_items

  def to_s
  	name
  end
  
end
