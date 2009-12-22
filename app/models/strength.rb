class Strength < ActiveRecord::Base

  belongs_to :exercise_type
  has_many :strength_sets

end
