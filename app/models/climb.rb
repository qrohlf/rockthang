class Climb < ActiveRecord::Base
    has_many :pitches
    attr_reader :difficulty #numeric difficulty rating of the hardest pitch on the climb
    attr_reader :rating #string representation of the difficulty of the hardest pitch on the climb
end
