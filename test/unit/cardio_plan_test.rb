# == Schema Information
#
# Table name: cardio_plans
#
#  id              :integer(4)      not null, primary key
#  exercise_id     :integer(4)
#  time            :integer(4)      default(0)
#  level           :integer(4)      default(0)
#  incline         :decimal(3, 1)   default(0.0)
#  speed           :decimal(3, 1)   default(0.0)
#  distance        :decimal(5, 2)   default(0.0)
#  calories        :integer(4)      default(0)
#  min_hr          :integer(4)      default(0)
#  max_hr          :integer(4)      default(0)
#  notes           :string(255)
#  actual_time     :integer(4)      default(0)
#  actual_level    :integer(4)      default(0)
#  actual_incline  :decimal(3, 1)   default(0.0)
#  actual_speed    :decimal(3, 1)   default(0.0)
#  actual_distance :decimal(5, 2)   default(0.0)
#  actual_calories :integer(4)      default(0)
#  actual_min_hr   :integer(4)      default(0)
#  actual_max_hr   :integer(4)      default(0)
#  actual_notes    :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

require 'test_helper'

class CardioPlanTest < ActiveSupport::TestCase

  # Associations
  should_belong_to :exercise

  ##############################################################################
  # Adding
  context "A new cardio plan" do
    should "be added" do
      assert_save(CardioPlan.make_unsaved)
    end
  end

end
