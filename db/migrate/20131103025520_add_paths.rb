class AddPaths < ActiveRecord::Migration
  def change
    create_table :paths do |t|
      t.integer :climb1_id
      t.integer :climb2_id
    end
  end
end
