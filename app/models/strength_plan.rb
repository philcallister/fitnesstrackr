class StrengthPlan < ActiveRecord::Base

  belongs_to :exercise
  has_many :strength_set_plans

end