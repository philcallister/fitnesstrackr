require 'test_helper'

class ProgramTest < ActiveSupport::TestCase
  
  should_validate_presence_of :name, :description
  should_have_many :workout_plans

  ##############################################################################
  # Adding
  context "A new program" do
    # adding with and without names and descriptions
    context "with 'name'" do
      should "be added" do
        assert_save(Program.make_unsaved)
      end
      should "NOT be added as NULL" do
        bad_name(Program.make_unsaved(:name_nil))
      end
    end
    context "with 'description'" do
      should "NOT be added as NULL" do
        bad_description(Program.make_unsaved(:description_nil))
      end
    end
    context "with 'name' and 'description'" do
      should "NOT be added when both NULL" do
        bad_both(Program.make_unsaved(:both_nil))
      end
    end
    # adding with length validation
    context "while validating lengths" do
      context "with 'name'" do
        should "be added with a 'name' <= max" do
          good_name(Program.make_unsaved(:name_max))
        end
        should "NOT be added with a 'name' > max" do
          bad_name(Program.make_unsaved(:name_over))
        end
      end
      context "with 'description'" do
        should "be added with a 'description' <= max" do
          good_description(Program.make_unsaved(:description_max))
        end
        should "NOT be added with a 'description' > max" do
          bad_description(Program.make_unsaved(:description_over))
        end
      end
      context "with 'name' and 'description'" do
        should "be added with both <= max" do
          good_both(Program.make_unsaved(:both_max))
        end
        should "NOT be added with both > max" do
          bad_both(Program.make_unsaved(:both_over))
        end
      end
    end
  end

  ##############################################################################
  # Updating
  context "An existing program" do
    setup do
      @program = Program.make do |program|
        3.times { program.workout_plans.make }
      end
    end

    context "with workout plans" do
      should "have 3 workout plans" do
        assert_equal 3, @program.workout_plans.length
      end
      should "have a new workout plan added" do
        @program.workout_plans << WorkoutPlan.make
        assert_equal 4, @program.workout_plans.length
      end
    end
  end

end
