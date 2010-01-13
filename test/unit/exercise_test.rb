require 'test_helper'

class ExerciseTest < ActiveSupport::TestCase

  # Validations
  should_validate_presence_of :name, :description, :kind
  should_ensure_length_in_range :name, 1..50
  should_ensure_length_in_range :description, 1..255
  should_not_allow_values_for :name, nil
  should_not_allow_values_for :description, nil

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
