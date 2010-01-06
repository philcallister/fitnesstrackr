require 'test_helper'

class ProgramTest < ActiveSupport::TestCase

  # Validations
  should_validate_presence_of :name, :description
  should_ensure_length_in_range :name, 1..50
  should_ensure_length_in_range :description, 1..255
  should_not_allow_values_for :name, nil
  should_not_allow_values_for :description, nil

  # Associations
  should_have_many :workout_plans
  
  ##############################################################################
  # Adding
  context "A new program" do
    should "be added" do
      assert_save(Program.make_unsaved)
    end
  end

  ##############################################################################
  # Associations
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
        @program.workout_plans << WorkoutPlan.make(:program => nil)
        assert_equal 4, @program.workout_plans.length
      end
    end
  end

end
