class Supplier < ActiveRecord::Base
  has_many :phones, as: :contact_detail
  accepts_nested_attributes_for :phones, allow_destroy: true  
  has_many :purchase_orders
  has_many :purchase_items, through: :purchase_orders
  has_many :supplier_items
  has_many :items, through: :supplier_items

  def to_s
  	name
  end

  def purchase_orders_cache_key
  	"po/#{generic_cache_key(purchase_orders)}-pi/#{generic_cache_key(purchase_items)}"
  end

  def confirmed_po_cache_key
  	po_cache_key(purchase_orders.confirmed)
  end

  def pending_po_cache_key
  	po_cache_key(purchase_orders.pending)
  end

  def delivered_po_cache_key
  	po_cache_key(purchase_orders.delivered)
  end

  def po_cache_key(purchase_orders)
  	po = purchase_orders
  	pi = PurchaseItem.where(purchase_order_id: purchase_orders)
  	di = ItemDelivery.where(purchase_order_id: purchase_orders)
  	"po/#{generic_cache_key(po)}-pi/#{generic_cache_key(pi)}-di/#{generic_cache_key(di)}"
  end
end
