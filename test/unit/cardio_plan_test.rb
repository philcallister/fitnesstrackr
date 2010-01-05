require 'test_helper'

class CardioPlanTest < ActiveSupport::TestCase

  # Associations
  should_belong_to :exercise

  ##############################################################################
  # Adding
  context "A new cardio plan" do
    should "be added" do
      assert_save(CardioPlan.make_unsaved)
    end
  end

end
