class PurchaseItem < ActiveRecord::Base
  include PublicActivity::Common
  
  belongs_to :item
  belongs_to :purchase_order

   validates :item, presence: true

   before_update :recalculate_total
   before_save :recalculate_total

   after_save :update_grand_total
   after_destroy :update_grand_total

   scope :last_item, ->(item_id) {where("item_id = ? and price > 0", item_id).last}

  def total=(new_price)
    x = price * quantity if price && quantity
    write_attribute :total, x
  end

  def price=(new_price)
    write_attribute :price, new_price
    recalculate_total
  end

  def quantity=(new_quantity)
    write_attribute :quantity, new_quantity
    recalculate_total
  end

  def details_item_price
    "#{price}Php x #{quantity} #{unit}" if item
  end

  def details
    "#{purchase_order.details} Item ##{id}[#{to_s}]"
  end

  def to_s
  	"#{item.name} - #{price}Php x #{quantity} #{unit}" if item
  end

  def item_name
  	item.try :name
  end

  def item_name=(name)
  	self.item = Item.find_or_create_by(name: name) if name.present?
  end

  def recalculate_total
    self.total = price * quantity if price && quantity
  end

  def update_grand_total
    purchase_order.grand_total = purchase_order.purchase_items.sum(:total)
    purchase_order.save
  end

  def record_activity(action, current_user, description)
    create_activity action, 
        owner: current_user, 
        recipient: self.purchase_order,
        parameters: {
        description: description,
        details: self.details}
  end

  def record_update(current_user, params)
    create_activity :update, 
        owner: current_user, 
        recipient: self.purchase_order,
        parameters: {
        description: "Updated PO Item",
        details: "#{purchase_order.details} - Item ##{id}[#{params}]"
      }
  end

  def self.last_by_item_name(item_name)
    item = Item.find_by(name: item_name)
    if item
      @purchase_item = PurchaseItem.last_item(item.id)
    end
  end


end
