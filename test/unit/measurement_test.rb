# == Schema Information
#
# Table name: measurements
#
#  id           :integer(4)      not null, primary key
#  user_id      :integer(4)
#  measure_date :date
#  weight       :integer(4)
#  waist        :string(255)
#  wrist        :string(255)
#  chest        :string(255)
#  hip          :string(255)
#  bicep        :string(255)
#  forearm      :string(255)
#  thigh        :string(255)
#  calve        :string(255)
#  neck         :string(255)
#  resting_hr   :integer(4)
#  bp_systolic  :integer(4)
#  bp_diastolic :integer(4)
#  v02_max      :integer(4)
#  created_at   :datetime
#  updated_at   :datetime
#

require 'test_helper'

class MeasurementTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
