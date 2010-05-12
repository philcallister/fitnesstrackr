class Measurement < ActiveRecord::Base

  WEIGHT = 1
  WAIST = 2
  BMI = 3
  CARDIO = 4

  belongs_to :user

end
