json.array!(@climbs) do |climb|
  json.extract! climb, :name
  json.url climb_url(climb, format: :json)
end
