class WorkoutBlock < ActiveRecord::Base

  # Validations
  validates_presence_of :name, :description
  validates_length_of :name, :within => 1..50
  validates_length_of :description, :within => 1..255

  # Associations
  belongs_to :program
  has_many :workout_plans
  acts_as_list :scope => :program

end
