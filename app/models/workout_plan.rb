class WorkoutPlan < ActiveRecord::Base

  # Validations
  validates_presence_of :name, :description
  validates_length_of :name, :within => 1..50
  validates_length_of :description, :within => 1..255

  # Associations
  belongs_to :workout_block
  acts_as_list :scope => :workout_block, :column => 'workout_plan_position'
  has_many :workouts

  has_many_polymorphs :exercise_plans,
                      :through => :exercises_workout_plans,
                      :from => [:cardio_plans, :strength_plans, :single_plans],
                      :order => 'exercise_workout_plan_position'

end
