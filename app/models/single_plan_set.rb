# == Schema Information
#
# Table name: single_plan_sets
#
#  id             :integer(4)      not null, primary key
#  single_plan_id :integer(4)
#  number         :integer(4)      default(0)
#  completed      :boolean(1)
#  actual_number  :integer(4)      default(0)
#

class SinglePlanSet < ActiveRecord::Base

  belongs_to :single_plan

end
