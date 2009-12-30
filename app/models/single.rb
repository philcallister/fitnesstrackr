class Single < ActiveRecord::Base

  belongs_to :exercise
  has_many :single_sets

end
