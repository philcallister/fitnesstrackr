class ExercisesWorkoutPlan < ActiveRecord::Base

  belongs_to :workout_plan
  belongs_to :exercise_plan, :polymorphic => true
  acts_as_list :scope => :workout_plan
  
end