class PurchaseItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :purchase_order

  def to_s
  	"#{item.name} - #{price}Php x #{quantity} #{note}" if item
  end

  def item_name
  	item.try :name
  end

  def item_name=(name)
  	self.item = Item.find_or_create_by(name: name) if name.present?
  end

end
