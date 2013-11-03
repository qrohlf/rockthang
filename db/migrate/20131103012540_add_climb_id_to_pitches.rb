class AddClimbIdToPitches < ActiveRecord::Migration
  def change
    add_column :pitches, :climb_id, :integer
  end
end
