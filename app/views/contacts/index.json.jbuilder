json.array!(@contacts) do |contact|
  json.extract! contact, :id, :name, :notes
  json.url contact_url(contact, format: :json)
end
