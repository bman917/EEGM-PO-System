include ActionView::Helpers::NumberHelper

class PurchaseOrder < ActiveRecord::Base
  belongs_to :supplier
  has_many :phones, as: :contact_detail
  has_many :purchase_order_contacts
  has_many :purchase_items
  has_many :item_deliveries
  has_many :items, through: :purchase_items

  accepts_nested_attributes_for :phones, allow_destroy: true
  accepts_nested_attributes_for :purchase_order_contacts, allow_destroy: true
  accepts_nested_attributes_for :purchase_items, allow_destroy: true

  after_save :copy_phone unless :phones.empty?
  after_save :copy_contact unless :purchase_order_contacts.empty?

  def grand_total_formatted
    number_with_delimiter number_with_precision(self.grand_total, precision: 2)
  end

  def grand_total_formatted=(grand_total_formatted)
    self.grand_total = grand_total_formatted.delete ","
  end

  def supplier_name
  	supplier.try :name
  end

  def supplier_name=(name)
  	self.supplier = Supplier.find_or_create_by(name: name) if name.present?
  end

  def copy_phone
    phones.each do | phone |
      supplier.phones.create(number: phone.number) if supplier.phones.where(number: phone.number).empty?
    end
  end

  def copy_contact
    purchase_order_contacts.each do | contact |
      Contact.new(name: contact.name).save if Contact.where(name: contact.name).empty?
    end
  end

  def items_description

    desc = ""

    purchase_items.each do | item |
      desc += item.to_s + ", "
    end

    desc
  end

end
