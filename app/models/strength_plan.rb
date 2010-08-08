class StrengthPlan < ActiveRecord::Base

  belongs_to :exercise
  has_many :strength_plan_sets, :order => 'strength_plan_set_position', :dependent => :delete_all

end