json.array!(@item_deliveries) do |item_delivery|
  json.extract! item_delivery, :id, :item_id, :purchase_order_id, :quantity, :unit, :date_recieved
  json.url item_delivery_url(item_delivery, format: :json)
end
