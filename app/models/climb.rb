class Climb < ActiveRecord::Base
    has_many :pitches

    def difficulty #numeric difficulty rating of the hardest pitch on the climb
        pitches.map(&:difficulty).max
    end

    def rating #string representation of the difficulty of the hardest pitch on the climb
        puts "difficulty is nil for #{name}" if difficulty.nil?
        Pitch.difficulty_to_rating(difficulty)
    end

    def adjacent_climbs
        c = self
        paths = Path.where{(climb1 == c) | (climb2 == c)};
        climbs = Array.new
        paths.each do |path| 
            climbs.push((path.climb1 == c) ? path.climb2 : path.climb1)
        end
        climbs
    end
end
