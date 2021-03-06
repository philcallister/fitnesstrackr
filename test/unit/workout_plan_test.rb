# == Schema Information
#
# Table name: workout_plans
#
#  id                    :integer(4)      not null, primary key
#  workout_block_id      :integer(4)
#  name                  :string(50)      not null
#  description           :string(255)     not null
#  workout_plan_position :integer(4)
#  has_pt                :boolean(1)      not null
#  completed             :boolean(1)
#  created_at            :datetime
#  updated_at            :datetime
#

require 'test_helper'

class WorkoutPlanTest < ActiveSupport::TestCase

  # Validations
  should_validate_presence_of :name, :description
  should_ensure_length_in_range :name, 1..50
  should_ensure_length_in_range :description, 1..255
  should_not_allow_values_for :name, nil
  should_not_allow_values_for :description, nil

  # Associations
  should_belong_to :workout_block

  # TODO: For now, we're removing this association.  Let's circle-back at
  # to determine if we want to keep completed workout information in this
  # association
  #has_many :workouts
  #should_have_many :workouts

  ##############################################################################
  # Adding
  context "A new workout plan" do
    should "be added" do
      assert_save(WorkoutPlan.make_unsaved)
    end
  end
  
  ##############################################################################
  # Associations -- Exercise Plans
  context "An existing workout plan (exercise plans)" do
    setup do
      @workout_plan = WorkoutPlan.make do |wp|
        12.times { wp.exercises_workout_plans.make }
      end
    end
    context "with exercise plans" do
      should "have 12 exercise plans" do
        assert_equal 12, @workout_plan.exercise_plans.length
      end
      should "have 5 cardio plans" do
        assert_equal 5, @workout_plan.cardio_plans.length
      end
      should "have 6 strength plans" do
        assert_equal 6, @workout_plan.strength_plans.length
      end
      should "have 1 single plan" do
        assert_equal 1, @workout_plan.single_plans.length
      end
    end
    context "when adding new exercise plans" do
      should "have a new exercise plan added (cardio)" do
        @workout_plan.exercise_plans << CardioPlan.make
        assert_equal 13, @workout_plan.exercise_plans.length
        assert_equal 6, @workout_plan.cardio_plans.length
      end
      should "have a new exercise plan added (strength)" do
        @workout_plan.exercise_plans << StrengthPlan.make
        assert_equal 13, @workout_plan.exercise_plans.length
        assert_equal 7, @workout_plan.strength_plans.length
      end
      should "have a new exercise plan added (single)" do
        @workout_plan.exercise_plans << SinglePlan.make
        assert_equal 13, @workout_plan.exercise_plans.length
        assert_equal 2, @workout_plan.single_plans.length
      end
    end
  end

  ##############################################################################
  # Associations -- Workouts
  # TODO: For now, we're removing this association.  Let's circle-back at
  # to determine if we want to keep completed workout information in this
  # association
  #has_many :workouts
=begin
  context "An existing workout plan (workouts)" do
    setup do
      @workout_plan = WorkoutPlan.make do |wp|
        5.times { wp.workouts.make }
      end
    end
    context "when adding new workouts" do
      should "have a new workout added" do
        @workout_plan.workouts << Workout.make
        assert_equal 6, @workout_plan.workouts.length
      end
    end
  end
=end

end
