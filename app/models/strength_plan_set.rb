# == Schema Information
#
# Table name: strength_plan_sets
#
#  id                         :integer(4)      not null, primary key
#  strength_plan_id           :integer(4)
#  reps                       :integer(4)      default(0)
#  weight                     :integer(4)      default(0)
#  strength_plan_set_position :integer(4)
#  completed                  :boolean(1)
#  actual_reps                :integer(4)      default(0)
#  actual_weight              :integer(4)      default(0)
#

class StrengthPlanSet < ActiveRecord::Base

  belongs_to :strength_plan
  acts_as_list :scope => :strength_plan, :column => 'strength_plan_set_position'
end
