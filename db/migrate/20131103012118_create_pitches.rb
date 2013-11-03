class CreatePitches < ActiveRecord::Migration
  def change
    create_table :pitches do |t|
      t.integer :difficulty

      t.timestamps
    end
  end
end
