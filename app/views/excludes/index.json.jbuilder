json.array!(@excludes) do |exclude|
  json.extract! exclude, :id, :date
  json.url exclude_url(exclude, format: :json)
end
