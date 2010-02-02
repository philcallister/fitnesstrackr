class ExercisesWorkout < ActiveRecord::Base

  belongs_to :workout
  belongs_to :exercise, :polymorphic => true
  acts_as_list :scope => :workout, :column => 'exercise_workout_position'

end
