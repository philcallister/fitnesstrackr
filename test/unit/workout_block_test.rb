require 'test_helper'

class WorkoutBlockTest < ActiveSupport::TestCase

  # Validations
  should_validate_presence_of :name, :description
  should_ensure_length_in_range :name, 1..50
  should_ensure_length_in_range :description, 1..255
  should_not_allow_values_for :name, nil
  should_not_allow_values_for :description, nil

  # Associations
  should_belong_to :program
  should_have_many :workout_plans

  ##############################################################################
  # Adding
  context "A new workout block" do
    should "be added" do
      assert_save(WorkoutBlock.make_unsaved)
    end
  end

  ##############################################################################
  # Associations -- Workout Plans
  context "An existing workout block (workout plans)" do
    setup do
      @workout_block = WorkoutBlock.make do |wb|
        4.times { wb.workout_plans.make }
      end
    end
    context "with workout plans" do
      should "have 4 workout plans" do
        assert_equal 4, @workout_block.workout_plans.length
      end
      should "delete all workout plans" do
        workout_plans = @workout_block.workout_plans
        @workout_block.destroy
        workout_plans.each do |wp|
          deleted_workout_plan = WorkoutPlan.find(wp.id)
          assert_nil deleted_workout_plan
        end
      end
    end
  end

end
