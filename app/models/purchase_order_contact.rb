class PurchaseOrderContact < ActiveRecord::Base
  belongs_to :purchase_order

  after_save :copy_contact_name

  def copy_contact_name
  	Contact.copy(self.name)
  end

end
