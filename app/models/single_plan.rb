# == Schema Information
#
# Table name: single_plans
#
#  id          :integer(4)      not null, primary key
#  exercise_id :integer(4)
#  notes       :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class SinglePlan < ActiveRecord::Base

  belongs_to :exercise
  has_many :single_plan_sets

end
