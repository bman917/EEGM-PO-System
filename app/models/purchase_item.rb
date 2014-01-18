class PurchaseItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :purchase_order

   validates :item, presence: true

   after_save :update_grand_total
   after_destroy :update_grand_total

  def to_s
  	"#{item.name} - #{price}Php x #{quantity} #{unit}" if item
  end

  def item_name
  	item.try :name
  end

  def item_name=(name)
  	self.item = Item.find_or_create_by(name: name) if name.present?
  end

  def update_grand_total
    purchase_order.grand_total = purchase_order.purchase_items.sum(:total)
    purchase_order.save
  end


end
