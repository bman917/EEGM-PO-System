class PurchaseOrderContact < ActiveRecord::Base
  include PublicActivity::Common

  belongs_to :purchase_order

  after_save :copy_contact_name

  def copy_contact_name
  	Contact.copy(self.name)
  end

  def details
    "#{purchase_order.details} - #{name}"
  end

  def record_activity(action, current_user, description)
    create_activity action, 
        owner: current_user, 
        recipient: purchase_order,
        parameters: {
        description: description,
        details: self.details}
  end

end
