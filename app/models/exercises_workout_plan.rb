# == Schema Information
#
# Table name: exercises_workout_plans
#
#  id                             :integer(4)      not null, primary key
#  exercise_plan_id               :integer(4)
#  exercise_plan_type             :string(255)
#  workout_plan_id                :integer(4)
#  exercise_workout_plan_position :integer(4)
#  completed                      :boolean(1)
#

class ExercisesWorkoutPlan < ActiveRecord::Base

  belongs_to :workout_plan
  belongs_to :exercise_plan, :polymorphic => true
  acts_as_list :scope => :workout_plan, :column => 'exercise_workout_plan_position'
  
end
