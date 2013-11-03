require 'test_helper'

class ClimbTest < ActiveSupport::TestCase
    # test "the truth" do
    #   assert true
    # end
    def setup 
        @c1 = Climb.create
        @c1.pitches.create(difficulty: 1);
        @c1.pitches.create(difficulty: 2);
        @c1.pitches.create(difficulty: 3);
        @c2 = Climb.create
        @c2.pitches.create(difficulty: 8);
        @c2.pitches.create(difficulty: 2);

    end
    test "Difficulty" do 
        assert_equal 3, @c1.difficulty
        assert_equal 8, @c2.difficulty
    end
    test "Rating" do
        assert_equal "3rd class", @c1.rating
        assert_equal "5.4", @c2.rating
    end

    def teardown
        @c1.delete
        @c2.delete
    end
end
