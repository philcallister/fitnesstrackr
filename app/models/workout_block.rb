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
  has_many :workout_plans, :order => 'workout_plan_position' , :dependent => :delete_all

  def name_or_date
    if self.program
      (self.name == REPLACE_WITH_DATE) ? (self.program.start_date + ((self.workout_block_position - 1) * 7).days).strftime("%m/%d/%Y") : self.name
    else
      self.name
    end
  end

end
