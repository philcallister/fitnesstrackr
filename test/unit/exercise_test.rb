require 'test_helper'

class ExerciseTest < ActiveSupport::TestCase

  ##############################################################################
  # Adding
  context "A new exercise" do
    should "be added" do
      assert_save(Exercise.make_unsaved)
    end
    should "be added (cardio)" do
      Exercise.make(:cardio)
    end
    should "be added (strength)" do
      Exercise.make(:strength)
    end
    should "be added (single)" do
      Exercise.make(:single)
    end
  end

end
