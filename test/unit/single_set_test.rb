# == Schema Information
#
# Table name: single_sets
#
#  id        :integer(4)      not null, primary key
#  single_id :integer(4)
#  number    :integer(4)      default(0)
#

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
