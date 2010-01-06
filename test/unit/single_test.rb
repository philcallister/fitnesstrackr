require 'test_helper'

class SingleTest < ActiveSupport::TestCase

  # Associations
  should_belong_to :exercise
  should_have_many :single_sets

  ##############################################################################
  # Adding
  context "A new single" do
    should "be added" do
      assert_save(Single.make_unsaved)
    end
  end

end
