json.array!(@ings) do |ing|
  json.extract! ing, :content
  json.url ing_url(ing, format: :json)
end
