require 'test_helper'

class WorkoutTest < ActiveSupport::TestCase

  # Validations

  # Associations
  should_belong_to :workout_plan

  ##############################################################################
  # Adding
  context "A new workout" do
    should "be added" do
      assert_save(Workout.make_unsaved)
    end
  end

  ##############################################################################
  # Associations -- Exercises
  context "An existing workout (exercises)" do
    setup do
      @workout = Workout.make do |w|
        16.times { w.exercises_workouts.make }
      end
    end
    context "with exercises" do
      should "have 16 exercises" do
        assert_equal 16, @workout.exercises.length
      end
      should "have 6 cardios" do
        assert_equal 6, @workout.cardios.length
      end
      should "have 7 strengths" do
        assert_equal 7, @workout.strengths.length
      end
      should "have 3 singles" do
        assert_equal 3, @workout.singles.length
      end
    end
    context "when adding new exercises" do
      should "have a new exercise added (cardio)" do
        @workout.exercises << Cardio.make
        assert_equal 17, @workout.exercises.length
        assert_equal 7, @workout.cardios.length
      end
      should "have a new exercise added (strength)" do
        @workout.exercises << Strength.make
        assert_equal 17, @workout.exercises.length
        assert_equal 8, @workout.strengths.length
      end
      should "have a new exercise added (single)" do
        @workout.exercises << Single.make
        assert_equal 17, @workout.exercises.length
        assert_equal 4, @workout.singles.length
      end
    end
  end

end
