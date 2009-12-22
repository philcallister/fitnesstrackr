class CreateExercisesWorkoutPlans < ActiveRecord::Migration

  def self.up
    create_table :exercises_workout_plans do |t|
      t.references :exercise_plan, :polymorphic => true
      t.references :workout_plan
      t.integer :position
    end
  end

  def self.down
    drop_table :exercises_workout_plans
  end
  
end