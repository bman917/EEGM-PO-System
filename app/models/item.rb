class Item < ActiveRecord::Base
	attr_reader :label
	  has_many :supplier_items
  	has_many :suppliers, through: :supplier_items
    validates :name, uniqueness: true

    def css_id
      "item_#{id}"
    end

  	def label
  		self.name
  	end

  	def last_pi
  		@pi ||= PurchaseItem.last_item(self.id)
  	end

  	def last_po
  		if last_pi.class == PurchaseItem
  			last_pi.purchase_order
  		else
  			nil
  		end
  	end
end
