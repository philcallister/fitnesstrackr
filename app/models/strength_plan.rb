# == Schema Information
#
# Table name: strength_plans
#
#  id          :integer(4)      not null, primary key
#  exercise_id :integer(4)
#  notes       :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class StrengthPlan < ActiveRecord::Base

  belongs_to :exercise
  has_many :strength_plan_sets, :order => 'strength_plan_set_position', :dependent => :delete_all

end
