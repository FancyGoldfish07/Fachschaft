json.array!(@event_typs) do |event_typ|
  json.extract! event_typ, :id, :name
  json.url event_typ_url(event_typ, format: :json)
end
