json.array!(@datasets) do |dataset|
  json.extract! dataset, :name, :description
  json.url dataset_url(dataset, format: :json)
end