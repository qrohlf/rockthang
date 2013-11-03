class Path < ActiveRecord::Base
    belongs_to :climb1, :class_name => 'Climb'
    belongs_to :climb2, :class_name => 'Climb'
end
