class WorkoutPlan < ActiveRecord::Base

  belongs_to :program
  has_many :workouts
  has_many_polymorphs :exercise_plans,
                         :through => :exercises_workout_plan,
                         :from => [:cardio_plans, :strength_plans, :single_plans],
                         :order => 'position'

end
