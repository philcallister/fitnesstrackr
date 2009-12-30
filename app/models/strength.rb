class Strength < ActiveRecord::Base

  belongs_to :exercise
  has_many :strength_sets

end
