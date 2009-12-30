require 'test_helper'

class WorkoutPlanTest < ActiveSupport::TestCase

  # Validations
  should_validate_presence_of :name, :description
  should_ensure_length_in_range :name, 1..50
  should_ensure_length_in_range :description, 1..255

  # Associations
  should_have_many :workouts

  ##############################################################################
  # Adding
  context "A new workout plan" do
    # adding with and without names and descriptions
    context "with 'name'" do
      should "be added" do
        assert_save(WorkoutPlan.make_unsaved)
      end
      should "NOT be added as NULL" do
        bad_name(WorkoutPlan.make_unsaved(:name => nil))
      end
    end
    context "with 'description'" do
      should "NOT be added as NULL" do
        bad_description(WorkoutPlan.make_unsaved(:description => nil))
      end
    end
    context "with 'name' and 'description'" do
      should "NOT be added when both NULL" do
        bad_both(WorkoutPlan.make_unsaved(:name => nil, :description => nil))
      end
    end
  end
  
end
