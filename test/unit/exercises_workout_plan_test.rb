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
    context "with basic 'position' testing" do
      should "move 1st to bottom (2 items)" do
        ewp = @workout_plan_1.exercises_workout_plans.first
        ewp.move_to_bottom
        assert_equal 2, ewp.position
        assert_equal @workout_plan_1.exercise_plans.last.exercises_workout_plans.first, ewp
      end
      should "move 1st to bottom (3 items)" do
        ewp = @workout_plan_2.exercises_workout_plans.first
        ewp.move_to_bottom
        assert_equal 3, ewp.position
        assert_equal @workout_plan_2.exercise_plans.last.exercises_workout_plans.first, ewp
      end
      should "move 1st down one (3 items)" do
        ewp = @workout_plan_2.exercises_workout_plans.first
        ewp.move_lower
        assert_equal 2, ewp.position
        assert_equal @workout_plan_2.exercise_plans[1].exercises_workout_plans.first, ewp
      end
    end
  end

end