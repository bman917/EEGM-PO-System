class Item < ActiveRecord::Base
	attr_reader :label
	has_many :supplier_items
  	has_many :suppliers, through: :supplier_items

  	def label
  		self.name
  	end
end
