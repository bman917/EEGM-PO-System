module PurchaseOrdersHelper
	def cache_key_for_purchase_order
	    count          = PurchaseOrder.count
	    max_updated_at = PurchaseOrder.maximum(:updated_at).try(:utc).try(:to_s, :number)
	    "purchase_order/all-#{count}-#{max_updated_at}"
	end
end
