json.array!(@lists) do |list|
  json.extract! list, :id, :user, :name
  json.url list_url(list, format: :json)
end
