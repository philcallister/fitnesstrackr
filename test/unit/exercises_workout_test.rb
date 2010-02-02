require 'test_helper'

class ExercisesWorkoutTest < ActiveSupport::TestCase

  # Associations
  should_belong_to :workout

  ##############################################################################
  # Adding
  context "A new exercises workout" do
    should "be added" do
      assert_save(ExercisesWorkout.make_unsaved)
    end
  end

  ##############################################################################
  # Associations -- Workout
  context "An existing exercises workout (workout)" do
    setup do
      @workout_1 = Workout.make
      2.times {ExercisesWorkout.make(:workout => @workout_1)}
      @workout_2 = Workout.make
      10.times {ExercisesWorkout.make(:workout => @workout_2)}
    end
    context "with exercises workout (workout)" do
      should "have correct # exercises workout plans" do
        assert_equal 2, @workout_1.exercises.length
        assert_equal 10, @workout_2.exercises.length
      end
    end
    context "with basic 'position' testing" do
      should "move 1st to bottom (2 items)" do
        ew = @workout_1.exercises_workouts.first
        ew.move_to_bottom
        assert_equal 2, ew.exercise_workout_position
        assert_equal @workout_1.exercises.last.exercises_workouts.first, ew
      end
      should "move 1st to bottom (10 items)" do
        ew = @workout_2.exercises_workouts.first
        ew.move_to_bottom
        assert_equal 10, ew.exercise_workout_position
        assert_equal @workout_2.exercises.last.exercises_workouts.first, ew
      end
      should "move 1st down one (10 items)" do
        ew = @workout_2.exercises_workouts.first
        ew.move_lower
        assert_equal 2, ew.exercise_workout_position
        assert_equal @workout_2.exercises[1].exercises_workouts.first, ew
      end
    end
  end

end
