require 'test_helper'

class SinglePlanSetTest < ActiveSupport::TestCase

  # Associations
  should_belong_to :single_plan

  ##############################################################################
  # Adding
  context "A new single plan set" do
    should "be added" do
      assert_save(SinglePlanSet.make_unsaved)
    end
  end
end
