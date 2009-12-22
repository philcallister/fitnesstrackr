class CreateWorkouts < ActiveRecord::Migration

  def self.up
    create_table :workouts do |t|
      t.references :workout_plan
      t.string :notes, :limit => 255, :null => true

      t.timestamps
    end
  end

  def self.down
    drop_table :workouts
  end

end
