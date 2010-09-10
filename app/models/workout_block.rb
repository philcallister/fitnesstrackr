# == Schema Information
#
# Table name: workout_blocks
#
#  id                     :integer(4)      not null, primary key
#  program_id             :integer(4)
#  name                   :string(50)      not null
#  description            :string(255)     not null
#  workout_block_position :integer(4)
#  completed              :boolean(1)
#  created_at             :datetime
#  updated_at             :datetime
#

class WorkoutBlock < ActiveRecord::Base

  REPLACE_WITH_DATE = "<<date>>"
  NO_DESCRIPTION = "No description"

  # Validations
  validates_presence_of :name, :description
  validates_length_of :name, :within => 1..50
  validates_length_of :description, :within => 1..255

  # Associations
  belongs_to :program
  acts_as_list :scope => :program, :column => 'workout_block_position'
  has_many :workout_plans, :order => 'workout_plan_position' , :dependent => :delete_all do
    def first_not_completed
      first(:conditions => 'completed = false')
    end
  end

  def name_or_date
    if self.program
      (self.name == REPLACE_WITH_DATE) ? (self.program.start_date + ((self.workout_block_position - 1) * 7).days).strftime("%m/%d/%Y") : self.name
    else
      self.name
    end
  end

end
