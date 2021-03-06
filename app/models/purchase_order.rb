include ActionView::Helpers::NumberHelper

class PurchaseOrder < ActiveRecord::Base
  include PublicActivity::Common

  belongs_to :supplier
  has_many :phones, as: :contact_detail, :dependent => :delete_all
  has_many :purchase_order_contacts, :dependent => :delete_all
  has_many :purchase_items, :dependent => :delete_all
  has_many :item_deliveries, :dependent => :delete_all
  has_many :items, through: :purchase_items

  accepts_nested_attributes_for :phones, allow_destroy: true
  accepts_nested_attributes_for :purchase_order_contacts, allow_destroy: true
  accepts_nested_attributes_for :purchase_items, allow_destroy: true

  after_save :copy_phone unless :phones.empty?
  after_save :copy_contact unless :purchase_order_contacts.empty?

  validates :supplier, presence: true

  scope :pending, -> {where(status: 'PENDING').order(po_date: :desc)}
  scope :confirmed, -> {where(status: 'CONFIRMED').order(po_date: :desc)}
  scope :delivered, -> {where(status: 'DELIVERED').order(po_date: :desc)}
  scope :cancelled, -> {where(status: 'CANCELLED').order(po_date: :desc)}

  def completed?(item)
    count_delivery_item(item) >= count_item_order(item)
  end

  def count_item_order(item)
    if purchase_items
      purchase_items.where(item: item).sum(:quantity)
    else
      0
    end
  end

  def count_delivery_item(item)
    if item_deliveries
      item_deliveries.where(item: item).sum(:quantity)
    else
      0
    end
  end

  def po_id
    sprintf('%07d', id)
  end

  def details
    "PO##{po_id} #{po_date.to_time.to_s(:med) if po_date} #{supplier.try :name}"
  end

  def po_date_long_format
    po_date.to_time.to_s(:long)
  end

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
      desc += item.to_s + ", " if item
    end

    desc
  end

  def record_activity(action, current_user, description)
    create_activity action, 
        owner: current_user, 
        recipient: self,
        parameters: {
        description: description,
        details: self.details}
  end

  def record_update(current_user, params)
    create_activity :update, 
        owner: current_user, 
        recipient: self,
        parameters: {
        description: "Updated PO",
        details: "#{self.details} #{params}"
      }
  end

  def purchase_items_cache_key
    "#{cache_key}-#{pi_key}-#{di_key}"
  end

  def item_deliveries_cache_key
    "#{cache_key}-#{di_key}"
  end

  def di_key
    "di/#{generic_cache_key(item_deliveries)}"
  end

  def pi_key
    "pi/#{generic_cache_key(purchase_items)}"
  end
end
