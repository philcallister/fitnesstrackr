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
