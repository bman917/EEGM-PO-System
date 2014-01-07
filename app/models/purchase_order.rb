class PurchaseOrder < ActiveRecord::Base
  belongs_to :supplier
  has_many :phones, as: :contact_detail
  has_many :purchase_order_contacts

  accepts_nested_attributes_for :phones, allow_destroy: true
  accepts_nested_attributes_for :purchase_order_contacts, allow_destroy: true

  def supplier_name
  	supplier.try :name
  end

  def supplier_name=(name)
  	self.supplier = Supplier.find_or_create_by(name: name) if name.present?
  end

end
