# == Schema Information
#
# Table name: workouts
#
#  id              :integer(4)      not null, primary key
#  workout_plan_id :integer(4)
#  notes           :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class Workout < ActiveRecord::Base

  belongs_to :workout_plan
  has_many_polymorphs :exercises,
                      :through => :exercises_workouts,
                      :from => [:cardios, :strengths, :singles],
                      :order => 'exercise_workout_position'
end
