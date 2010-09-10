# == Schema Information
#
# Table name: strengths
#
#  id          :integer(4)      not null, primary key
#  exercise_id :integer(4)
#  notes       :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

require 'test_helper'

class StrengthTest < ActiveSupport::TestCase

  # Associations
  should_belong_to :exercise
  should_have_many :strength_sets

  ##############################################################################
  # Adding
  context "A new strength" do
    should "be added" do
      assert_save(Strength.make_unsaved)
    end
  end

end
