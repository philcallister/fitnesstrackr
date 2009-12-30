require 'test_helper'

class WorkoutPlanTest < ActiveSupport::TestCase

  should_validate_presence_of :name, :description

  ##############################################################################
  # Adding
  context "A new workout plan" do
    # adding with and without names and descriptions
    context "with 'name'" do
      should "be added" do
        assert_save(WorkoutPlan.make_unsaved)
      end
      should "NOT be added as NULL" do
        bad_name(WorkoutPlan.make_unsaved(:name_nil))
      end
    end
    context "with 'description'" do
      should "NOT be added as NULL" do
        bad_description(WorkoutPlan.make_unsaved(:description_nil))
      end
    end
    context "with 'name' and 'description'" do
      should "NOT be added when both NULL" do
        bad_both(WorkoutPlan.make_unsaved(:both_nil))
      end
    end
    # adding with length validation
    context "while validating lengths" do
      context "with 'name'" do
        should "be added with a 'name' <= max" do
          good_name(WorkoutPlan.make_unsaved(:name_max))
        end
        should "NOT be added with a 'name' > max" do
          bad_name(WorkoutPlan.make_unsaved(:name_over))
        end
      end
      context "with 'description'" do
        should "be added with a 'description' <= max" do
          good_description(WorkoutPlan.make_unsaved(:description_max))
        end
        should "NOT be added with a 'description' > max" do
          bad_description(WorkoutPlan.make_unsaved(:description_over))
        end
      end
      context "with 'name' and 'description'" do
        should "be added with both <= max" do
          good_both(WorkoutPlan.make_unsaved(:both_max))
        end
        should "NOT be added with both > max" do
          bad_both(WorkoutPlan.make_unsaved(:both_over))
        end
      end
    end
  end
  
end
