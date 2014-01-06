class Item < ActiveRecord::Base
	has_many :supplier_items
  	has_many :suppliers, through: :supplier_items
end
