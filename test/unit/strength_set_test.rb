# == Schema Information
#
# Table name: strength_sets
#
#  id          :integer(4)      not null, primary key
#  strength_id :integer(4)
#  reps        :integer(4)      default(0)
#  weight      :integer(4)      default(0)
#

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
