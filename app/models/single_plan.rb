class SinglePlan < ActiveRecord::Base

  belongs_to :exercise_type
  has_many :single_set_plans

end
