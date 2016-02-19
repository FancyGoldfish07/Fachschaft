json.array!(@subscribers) do |subscriber|
  json.extract! subscriber, :id, :email, :date
  json.url subscriber_url(subscriber, format: :json)
end
