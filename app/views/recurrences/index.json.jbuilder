json.array!(@recurrences) do |recurrence|
  json.extract! recurrence, :id, :event_id, :start, :end, :pattern
  json.url recurrence_url(recurrence, format: :json)
end
