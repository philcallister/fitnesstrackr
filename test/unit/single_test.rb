# == Schema Information
#
# Table name: singles
#
#  id          :integer(4)      not null, primary key
#  exercise_id :integer(4)
#  notes       :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

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
