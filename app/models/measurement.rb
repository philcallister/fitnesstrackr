class Measurement < ActiveRecord::Base

  WEIGHT = 1
  WAIST = 2
  BMI = 3

  belongs_to :user

end
