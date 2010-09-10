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

require 'test_helper'

class StrengthPlanSetTest < ActiveSupport::TestCase

  # Associations
  should_belong_to :strength_plan

  ##############################################################################
  # Adding
  context "A new strength plan set" do
    should "be added" do
      assert_save(StrengthPlanSet.make_unsaved)
    end
  end

end
