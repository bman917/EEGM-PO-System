class ItemDelivery < ActiveRecord::Base
include PublicActivity::Common

  belongs_to :item
  belongs_to :purchase_order

  def date_received_long
  	date_recieved.to_time.to_s(:long)
  end

  def date_received_med
  	date_recieved.to_time.to_s(:med)
  end

  def details
    "#{purchase_order.details} - Delivery ##{id}[#{to_s}]"
  end

  def to_s
  	"#{item.name} - #{quantity} #{unit} #{date_received_med}" if item
  end

  def item_name
  	item.try :name
  end

  def item_name=(name)
  	self.item = Item.find_by(name: name) if name
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
        description: "Updated PO Delivery Item",
        details: "#{purchase_order.details} - Delivery ##{id}[#{params}]"
      }
  end

end
