module PurchaseItemsHelper
	def cache_key_for_purchase_item
	    count          = PurchaseItem.count
	    max_updated_at = PurchaseItem.maximum(:updated_at).try(:utc).try(:to_s, :number)
	    "#{cache_key_for_purchase_order}-purchase_item/all-#{count}-#{max_updated_at}"
	end
end
