json.array!(@dataflows) do |dataflow|
  json.extract! dataflow, :dataset_id, :interface_id
  json.url dataflow_url(dataflow, format: :json)
end