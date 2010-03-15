class User < ActiveRecord::Base

  # Validations
  validates_length_of :goal, :maximum => 100, :allow_nil => true, :allow_blank => true

  # Associations
  has_many :measurements do
    def current(reload=false)
      @current_measurement = nil if reload
      @current_measurement ||= first(:conditions => "measure_date = '#{Date.today}'")
    end
  end

  acts_as_authentic do |c|
    #c.my_config_option = my_value # for available options see documentation in: Authlogic::ActsAsAuthentic
  end # block optional
end
