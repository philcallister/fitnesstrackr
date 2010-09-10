# == Schema Information
#
# Table name: users
#
#  id                  :integer(4)      not null, primary key
#  login               :string(255)     not null
#  email               :string(255)     not null
#  crypted_password    :string(255)     not null
#  password_salt       :string(255)     not null
#  persistence_token   :string(255)     not null
#  single_access_token :string(255)     not null
#  perishable_token    :string(255)     not null
#  login_count         :integer(4)      default(0), not null
#  failed_login_count  :integer(4)      default(0), not null
#  last_request_at     :datetime
#  current_login_at    :datetime
#  last_login_at       :datetime
#  current_login_ip    :string(255)
#  last_login_ip       :string(255)
#  gender              :integer(4)
#  birthday            :date
#  height              :integer(4)
#  goal                :string(100)
#  goal_start_date     :date
#  goal_end_date       :date
#  created_at          :datetime
#  updated_at          :datetime
#

class User < ActiveRecord::Base

  ALL = 0
  MAIN = 1
  GOAL = 2
  PERSONAL = 3

  # Validations
  validates_length_of :goal, :maximum => 100, :allow_nil => true, :allow_blank => true

  # Associations
  has_many :programs
  has_many :measurements do
    def find_date(date)
      find_by_measure_date(date)
    end
    def recent
      first(:order => "measure_date DESC")
    end
    def current(reload=false)
      @current_measurement = nil if reload
      @current_measurement ||= find_by_measure_date(Date.today)
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
    return nil
  end

end
