class SinglePlan < ActiveRecord::Base

  belongs_to :exercise
  has_many :single_plan_sets

end
