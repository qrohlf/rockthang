json.array!(@pitches) do |pitch|
  json.extract! pitch, :difficulty
  json.url pitch_url(pitch, format: :json)
end
