json.array!(@frequencies) do |frequency|
  json.extract! frequency, :name
  json.url frequency_url(frequency, format: :json)
end