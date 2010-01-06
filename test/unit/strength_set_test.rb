require 'test_helper'

class StrengthSetTest < ActiveSupport::TestCase

  # Associations
  should_belong_to :strength

  ##############################################################################
  # Adding
  context "A new strength set" do
    should "be added" do
      assert_save(StrengthSet.make_unsaved)
    end
  end

end
