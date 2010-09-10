# == Schema Information
#
# Table name: single_plan_sets
#
#  id             :integer(4)      not null, primary key
#  single_plan_id :integer(4)
#  number         :integer(4)      default(0)
#  completed      :boolean(1)
#  actual_number  :integer(4)      default(0)
#

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
