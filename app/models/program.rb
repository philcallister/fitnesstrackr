# == Schema Information
#
# Table name: programs
#
#  id          :integer(4)      not null, primary key
#  user_id     :integer(4)
#  name        :string(50)      not null
#  description :string(500)     not null
#  start_date  :date
#  completed   :boolean(1)
#  created_at  :datetime
#  updated_at  :datetime
#

class Program < ActiveRecord::Base

  # Validations
  validates_presence_of :name, :description
  validates_length_of :name, :within => 1..50
  validates_length_of :description, :within => 1..500

  # Associations
  belongs_to :user
  has_many :workout_blocks, :order => 'workout_block_position' , :dependent => :delete_all do
    def first_not_completed
      first(:conditions => 'completed = false')
    end
  end

end
