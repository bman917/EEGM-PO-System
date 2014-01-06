json.array!(@suppliers) do |supplier|
  json.extract! supplier, :id, :name, :notes, :contact_detail_id
  json.url supplier_url(supplier, format: :json)
end
