require 'test_helper'

class StrengthPlanTest < ActiveSupport::TestCase

  # Associations
  should_belong_to :exercise
  should_have_many :strength_plan_sets

  ##############################################################################
  # Adding
  context "A new strength plan" do
    should "be added" do
      assert_save(StrengthPlan.make_unsaved)
    end
  end

end
