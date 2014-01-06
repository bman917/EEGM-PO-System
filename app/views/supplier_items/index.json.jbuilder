json.array!(@supplier_items) do |supplier_item|
  json.extract! supplier_item, :id, :supplier_id, :item_id, :price, :note
  json.url supplier_item_url(supplier_item, format: :json)
end
