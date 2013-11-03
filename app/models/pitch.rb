class Pitch < ActiveRecord::Base
    belongs_to :climb
    validates_presence_of :climb_id #Pitches must belong to a climb

    def self.class_ratings
        {
            1 => "1st class",
            2 => "2nd class",
            3 => "3rd class",
            4 => "4th class"
        }
    end

    def self.difficulty_to_rating(difficulty)
        if (difficulty < 5) 
            Pitch.class_ratings[difficulty]
        elsif (difficulty < 5+9) 
            "5.#{difficulty - 4}"
        else 
            letter = 'abcd'[(difficulty - 14) % 4]
            number = 10+(difficulty-14)/4
            "5.#{number}#{letter}"
        end
    end

    def rating
        Pitch.difficulty_to_rating(difficulty)
    end
end
