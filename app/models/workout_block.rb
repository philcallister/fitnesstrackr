class WorkoutBlock < ActiveRecord::Base

  # Validations
  validates_presence_of :name, :description
  validates_length_of :name, :within => 1..50
  validates_length_of :description, :within => 1..255

  # Associations
  belongs_to :program
  acts_as_list :scope => :program, :column => 'workout_block_position'
  has_many :workout_plans, :order => 'workout_plan_position'

end
