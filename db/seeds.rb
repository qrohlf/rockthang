# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Polpulate the database with information from the Morning Glory Wall at Smith Rocks
# Morning Glory Wall was chosen because it is popular, contains a wide variety of grades,
# and it is primarily sport climbs so the system's lack of ability to track trad climbs
# is less of an issue

# helper function to make creating single pitch climbs less of a chore
def makeSinglePitch(name, difficulty) 
    #puts "Creating single pitch climb named #{name} with difficulty #{Pitch.difficulty_to_rating(difficulty)}"
    Climb.create(name: name, pitches: [Pitch.create(difficulty: difficulty)])
end

# All climbs in Cocaine Gulley Lower Left are connected sequentially
cocaineGulleyLeft = Array.new

cocaineGulleyLeft << makeSinglePitch("Earth 2º", 16)
cocaineGulleyLeft << mudfest = makeSinglePitch("Baked Mudfest", 17)
roam = makeSinglePitch("Wherever I May Roam", 13)
Path.create(climb1: roam, climb2: mudfest)
cocaineGulleyLeft << hippo = makeSinglePitch("Hippos on Ice", 15)
Path.create(climb1: roam, climb2: hippo)
clams = makeSinglePitch("Dances with Clams", 14)
Path.create(climb1: roam, climb2: clams)
cocaineGulleyLeft << thieves = makeSinglePitch("Thieves", 22)
Path.create(climb1: clams, climb2: thieves)

cocaineGulleyLeft.each_with_index do |climb, i|
    break if i == cocaineGulleyLeft.count - 1
    Path.create(climb1: climb, climb2: cocaineGulleyLeft[i+1])
end

# The Rolling Stones wall is above and in-between Thieves and Exile on Main Street.
# It contains 2 climbs which both start at the same place
gimmeshelter = makeSinglePitch("Gimme Shelter", 21)
Path.create(climb1: thieves, climb2: gimmeshelter)
red = makeSinglePitch("Rudolph The Red", 10)
Path.create(climb1: gimmeshelter, climb2: red)
cowdog = makeSinglePitch("Voyage of the Cow Dog", 11)
Path.create(climb1: red, climb2: cowdog)

mainst = makeSinglePitch("Exile on Main Street", 18)
Path.create(climb1: thieves, climb2: mainst)
Path.create(climb1: mainst, climb2: gimmeshelter)

# All climbs in Cocaine Gulley Right are connected squentially
cocaineGulleyUpperLeft = Array.new

cocaineGulleyUpperLeft << bloodshot = makeSinglePitch("Bloodshot", 19)
Path.create(climb1: gimmeshelter, climb2: bloodshot) # The Rolling Stones wall is accessible via bloodshot
Path.create(climb1: mainst, climb2: bloodshot)       # The Rolling Stones wall is accessible via bloodshot
cocaineGulleyUpperLeft << makeSinglePitch("Quest to Fire", 22)
cocaineGulleyUpperLeft << makeSinglePitch("Choinard Crack", 13)
cocaineGulleyUpperLeft << makeSinglePitch("Crack Babies", 23)
cocaineGulleyUpperLeft << makeSinglePitch("Papillon", 12)
cocaineGulleyUpperLeft << makeSinglePitch("Crack Cocaine", 21)
cocaineGulleyUpperLeft << bongo = makeSinglePitch("Bongo Fury", 26)
Path.create(climb1: bongo, climb2: thieves)
cocaineGulleyUpperLeft << makeSinglePitch("Runt", 29)
cocaineGulleyUpperLeft << makeSinglePitch("Stand and Deliver", 24)
#I'm including Churning Buttress in the upper left wall group here.
cocaineGulleyUpperLeft << makeSinglePitch("Oxygen", 29)

cocaineGulleyUpperLeft.each_with_index do |climb, i|
    break if i == cocaineGulleyUpperLeft.count - 1
    Path.create(climb1: climb, climb2: cocaineGulleyUpperLeft[i+1])
end

