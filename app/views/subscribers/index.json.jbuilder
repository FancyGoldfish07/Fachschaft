json.array!(@subscribers) do |subscriber|
  json.extract! subscriber, :id, :name, :email
  json.url subscriber_url(subscriber, format: :json)
end
