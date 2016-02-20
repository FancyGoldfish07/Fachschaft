json.array!(@recurrences) do |recurrence|
  json.extract! recurrence, :id, :start, :end, :schedule
  json.url recurrence_url(recurrence, format: :json)
end
