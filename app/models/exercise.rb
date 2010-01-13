class Exercise < ActiveRecord::Base

  # Validations
  validates_presence_of :name, :description, :kind
  validates_length_of :name, :within => 1..50
  validates_length_of :description, :within => 1..255

end
