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

require 'test_helper'

class SinglePlanTest < ActiveSupport::TestCase

  # Associations
  should_belong_to :exercise
  should_have_many :single_plan_sets

  ##############################################################################
  # Adding
  context "A new single plan" do
    should "be added" do
      assert_save(SinglePlan.make_unsaved)
    end
  end

end
