class ItemDelivery < ActiveRecord::Base
  belongs_to :item
  belongs_to :purchase_order

  def item_name
  	item.try :name
  end

  def item_name=(name)
  	self.item = Item.find_by(name: name) if name
  end
end
