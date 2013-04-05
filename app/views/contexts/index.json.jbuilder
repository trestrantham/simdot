json.array!(@contexts) do |context|
  json.extract! context, 
  json.url context_url(context, format: :json)
end