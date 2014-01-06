json.array!(@phones) do |phone|
  json.extract! phone, :id, :phone_type, :number
  json.url phone_url(phone, format: :json)
end
