json.set! :nodes do
    json.array! @climbs do |climb|
        json.id climb.id
        json.name climb.name
        json.rating climb.rating
    end
end
json.set! :links do
    json.array! @paths do |path|
        json.source path.climb1.id
        json.target path.climb2.id
    end
end