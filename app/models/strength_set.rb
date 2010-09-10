# == Schema Information
#
# Table name: strength_sets
#
#  id          :integer(4)      not null, primary key
#  strength_id :integer(4)
#  reps        :integer(4)      default(0)
#  weight      :integer(4)      default(0)
#

class StrengthSet < ActiveRecord::Base

  belongs_to :strength

end
