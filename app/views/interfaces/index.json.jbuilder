json.array!(@interfaces) do |interface|
  json.extract! interface, :from_system_id, :to_system_id
  json.url interface_url(interface, format: :json)
end