json.array!(@events) do |event|
  json.extract! event, :id, :title, :start, :priority, :flag, :imageURL, :url, :end, :ort, :description, :backgroundColor
  json.url event_url(event, format: :json)
end
