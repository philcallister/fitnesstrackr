class WorkoutPlan < ActiveRecord::Base

  # Validations
  validates_presence_of :name, :description
  validates_length_of :name, :within => 1..50
  validates_length_of :description, :within => 1..255

  # Associations
  belongs_to :program
  has_many :workouts
  has_many_polymorphs :exercise_plans,
                         :through => :exercises_workout_plans,
                         :from => [:cardio_plans, :strength_plans, :single_plans],
                         :order => 'position'

end
