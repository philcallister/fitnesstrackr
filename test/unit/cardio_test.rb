require 'test_helper'

class CardioTest < ActiveSupport::TestCase

  # Associations
  should_belong_to :exercise

  ##############################################################################
  # Adding
  context "A new cardio" do
    should "be added" do
      assert_save(Cardio.make_unsaved)
    end
  end

end
