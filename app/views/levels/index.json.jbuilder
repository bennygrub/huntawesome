json.array!(@levels) do |level|
  json.extract! level, :id, :name, :description, :pillar, :points
  json.url level_url(level, format: :json)
end
