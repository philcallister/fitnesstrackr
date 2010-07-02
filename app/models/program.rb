class Program < ActiveRecord::Base

  # Validations
  validates_presence_of :name, :description
  validates_length_of :name, :within => 1..50
  validates_length_of :description, :within => 1..500

  # Associations
  belongs_to :user
  has_many :workout_blocks, :order => 'workout_block_position'

end
