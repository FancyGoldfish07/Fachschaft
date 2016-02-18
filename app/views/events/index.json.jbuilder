json.array!(@events) do |event|
  json.extract! event, :id, :title, :date, :priority, :flag, :imageURL, :externalLink, :revision, :typeOfDate, :editingDeadline, :userGroup
  json.url event_url(event, format: :json)
end
