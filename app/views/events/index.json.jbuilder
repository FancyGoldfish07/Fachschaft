json.array!(@events) do |event|
  json.extract! event, :id, :title, :start, :priority, :flag, :imageURL, :url, :repeat, :typeOfDate, :end, :userGroup
  json.url event_url(event, format: :json)
end
