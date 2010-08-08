class StrengthPlanSet < ActiveRecord::Base

  belongs_to :strength_plan
  acts_as_list :scope => :strength_plan, :column => 'strength_plan_set_position'
end
