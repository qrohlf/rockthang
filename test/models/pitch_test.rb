require 'test_helper'

class PitchTest < ActiveSupport::TestCase
    # test "the truth" do
    #   assert true
    # end
    test "Pitch Ratings Correct" do 
        p = Pitch.new(difficulty: 1)
        assert_equal "1st class", p.rating
        p.difficulty += 1
        assert_equal "2nd class", p.rating
        p.difficulty += 1
        assert_equal "3rd class", p.rating
        p.difficulty += 1
        assert_equal "4th class", p.rating
        p.difficulty += 1
        assert_equal "5.1", p.rating
        p.difficulty += 8
        assert_equal "5.9", p.rating
        p.difficulty += 1
        assert_equal "5.10a", p.rating
        p.difficulty += 1
        assert_equal "5.10b", p.rating
        p.difficulty += 1
        assert_equal "5.10c", p.rating
        p.difficulty += 1
        assert_equal "5.10d", p.rating
        p.difficulty += 1
        assert_equal "5.11a", p.rating
        p.difficulty += 1
        assert_equal "5.11b", p.rating
        p.difficulty += 3
        assert_equal "5.12a", p.rating
        p.difficulty += 1
        assert_equal "5.12b", p.rating
        # eventually should have a test for 5.15
    end
end