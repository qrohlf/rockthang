class AddNumberToPitch < ActiveRecord::Migration
  def change
    add_column :pitches, :number, :integer, :null => false, :default => 1
  end
end
