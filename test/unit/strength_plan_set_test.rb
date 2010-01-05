require 'test_helper'

class StrengthPlanSetTest < ActiveSupport::TestCase

  # Associations
  should_belong_to :strength_plan

  ##############################################################################
  # Adding
  context "A new strength plan set" do
    should "be added" do
      assert_save(StrengthPlanSet.make_unsaved)
    end
  end

end
