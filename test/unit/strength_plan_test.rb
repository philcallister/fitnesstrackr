require 'test_helper'

class StrengthPlanTest < ActiveSupport::TestCase

  # Associations
  should_belong_to :exercise
  should_have_many :strength_plan_sets

  ##############################################################################
  # Adding
  context "A new strength plan" do
    setup do
      @strength_plan = StrengthPlan.make do |sp|
        4.times { sp.strength_plan_sets.make }
      end
    end
    should "be added" do
      assert_save(StrengthPlan.make_unsaved)
    end
    should "delete all strength plan sets" do
      strength_plan_sets = @strength_plan.strength_plan_sets
      @strength_plan.destroy
      strength_plan_sets.each do |sps|
        deleted_strength_plan_set = StrengthPlanSet.find(sps.id)
        assert_nil deleted_strength_plan_set
      end
    end
  end

end
