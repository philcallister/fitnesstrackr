# == Schema Information
#
# Table name: workout_plans
#
#  id                    :integer(4)      not null, primary key
#  workout_block_id      :integer(4)
#  name                  :string(50)      not null
#  description           :string(255)     not null
#  workout_plan_position :integer(4)
#  has_pt                :boolean(1)      not null
#  completed             :boolean(1)
#  created_at            :datetime
#  updated_at            :datetime
#

class WorkoutPlan < ActiveRecord::Base

  # Validations
  validates_presence_of :name, :description
  validates_length_of :name, :within => 1..50
  validates_length_of :description, :within => 1..255

  # Associations
  belongs_to :workout_block
  acts_as_list :scope => :workout_block, :column => 'workout_plan_position'

  # TODO: For now, we're removing this association.  Let's circle-back at
  # to determine if we want to keep completed workout information in this
  # association
  #has_many :workouts
  
  has_many_polymorphs :exercise_plans,
                      :through => :exercises_workout_plans,
                      :from => [:cardio_plans, :strength_plans, :single_plans],
                      :order => 'exercise_workout_plan_position'

end
