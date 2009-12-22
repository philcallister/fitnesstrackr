class CreateExercisesWorkouts < ActiveRecord::Migration

  def self.up
    create_table :exercises_workouts do |t|
      t.references :exercise, :polymorphic => true
      t.references :workout
      t.integer :position
    end
  end

  def self.down
    drop_table :exercises_workouts
  end

end
