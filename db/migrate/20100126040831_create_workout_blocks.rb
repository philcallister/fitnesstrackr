class CreateWorkoutBlocks < ActiveRecord::Migration

  def self.up
    create_table :workout_blocks do |t|
      t.references :program
      t.string     :name, :limit => 50, :null => false
      t.string     :description, :limit => 255, :null => false
      t.integer    :workout_block_position
      t.boolean    :completed,   :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :workout_blocks
  end

end
