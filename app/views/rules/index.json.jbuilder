json.array!(@rules) do |rule|
  json.extract! rule, :id, :mode, :day, :recurrence_id
  json.url rule_url(rule, format: :json)
end
