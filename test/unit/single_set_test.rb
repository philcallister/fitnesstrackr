require 'test_helper'

class SingleSetTest < ActiveSupport::TestCase

  # Associations
  should_belong_to :single

  ##############################################################################
  # Adding
  context "A new single set" do
    should "be added" do
      assert_save(SingleSet.make_unsaved)
    end
  end

end
