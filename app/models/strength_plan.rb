class StrengthPlan < ActiveRecord::Base

  belongs_to :exercise_type
  has_many :strength_set_plans

end