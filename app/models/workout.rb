class Workout < ActiveRecord::Base

  belongs_to :workout_plan
  has_many_polymorphs :exercises,
                         :through => :exercises_workout,
                         :from => [:cardios, :strengths, :singles],
                         :order => 'position'
end
