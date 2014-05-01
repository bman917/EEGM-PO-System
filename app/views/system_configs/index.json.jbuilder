json.array!(@system_configs) do |system_config|
  json.extract! system_config, :id, :name, :value, :description
  json.url system_config_url(system_config, format: :json)
end
