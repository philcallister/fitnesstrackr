# == Schema Information
#
# Table name: exercises_workouts
#
#  id                        :integer(4)      not null, primary key
#  exercise_id               :integer(4)
#  exercise_type             :string(255)
#  workout_id                :integer(4)
#  exercise_workout_position :integer(4)
#

class ExercisesWorkout < ActiveRecord::Base

  belongs_to :workout
  belongs_to :exercise, :polymorphic => true
  acts_as_list :scope => :workout, :column => 'exercise_workout_position'

end
