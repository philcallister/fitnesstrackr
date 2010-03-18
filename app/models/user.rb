class User < ActiveRecord::Base

  ALL = 0
  MAIN = 1
  GOAL = 2
  PERSONAL = 3

  # Validations
  validates_length_of :goal, :maximum => 100, :allow_nil => true, :allow_blank => true

  # Associations
  has_many :measurements do
    def recent
      first(:order => "measure_date DESC")
    end
    def current(reload=false)
      @current_measurement = nil if reload
      @current_measurement ||= first(:conditions => "measure_date = '#{Date.today}'")
    end
  end

  acts_as_authentic do |c|
    #c.my_config_option = my_value # for available options see documentation in: Authlogic::ActsAsAuthentic
  end # block optional

  def age
    if birthday
      now = Date.today
      return now.year - birthday.year - ((now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)
    end
    return n=nil
  end

end
