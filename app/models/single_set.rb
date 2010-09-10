# == Schema Information
#
# Table name: single_sets
#
#  id        :integer(4)      not null, primary key
#  single_id :integer(4)
#  number    :integer(4)      default(0)
#

class SingleSet < ActiveRecord::Base

  belongs_to :single

end
