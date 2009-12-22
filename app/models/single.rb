class Single < ActiveRecord::Base

  belongs_to :exercise_type
  has_many :single_sets

end
