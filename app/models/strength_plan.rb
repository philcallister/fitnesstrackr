class StrengthPlan < ActiveRecord::Base

  belongs_to :exercise
  has_many :strength_plan_sets, :dependent => :delete_all

end