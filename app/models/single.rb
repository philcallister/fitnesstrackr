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

class Single < ActiveRecord::Base

  belongs_to :exercise
  has_many :single_sets

end
