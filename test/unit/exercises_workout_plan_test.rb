require 'test_helper'

class ExercisesWorkoutPlanTest < ActiveSupport::TestCase
  
  # Associations
  should_belong_to :workout_plan
  should_belong_to :exercise_plan

  ##############################################################################
  # Adding
  context "A new exercises workout plan" do
    should "be added" do
      assert_save(ExercisesWorkoutPlan.make_unsaved)
    end
  end

  ##############################################################################
  # Associations -- Workout Plan
  context "An existing exercises workout plan (workout plan)" do
    setup do
      @workout_plan_1 = WorkoutPlan.make
      2.times {ExercisesWorkoutPlan.make(:workout_plan => @workout_plan_1)}
      @workout_plan_2 = WorkoutPlan.make
      3.times {ExercisesWorkoutPlan.make(:workout_plan => @workout_plan_2)}
    end
    context "with exercises workout plan (workout plan)" do
      should "have correct # exercises workout plans" do
        assert_equal 2, @workout_plan_1.exercise_plans.length
        assert_equal 3, @workout_plan_2.exercise_plans.length
      end
    end
    context "with basic position testing" do
      should "move 1st to bottom" do
        @workout_plan_1.exercises_workout_plan.first.move_to_bottom
        #assert_equal 1, @workout_plan_1.exercises_workout_plan.first.position
      end
    end
  end

end
