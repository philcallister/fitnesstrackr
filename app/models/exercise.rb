class Exercise < ActiveRecord::Base

  CARDIO = 0
  STRENGTH = 1
  SINGLE = 2

  # Validations
  validates_presence_of :name, :description, :kind
  validates_length_of :name, :within => 1..50
  validates_length_of :description, :within => 1..255

  # Scope
  default_scope :order => 'name'

end
