json.array!(@newsletters) do |newsletter|
  json.extract! newsletter, :id, :subject, :description, :from, :to
  json.url newsletter_url(newsletter, format: :json)
end
