require 'machinist/active_record'
require 'sham'
require 'forgery'

################################################################################
# Program
PROGRAM_NAME = "program_"
PROGRAM_DESCRIPTION = "program_description_"

# Shams
Sham.program_name {|index| "#{PROGRAM_NAME}#{index}"}
Sham.program_description {|index| "#{PROGRAM_DESCRIPTION}#{index}"}

# Builders
Program.blueprint do
  name {Sham.program_name}
  description {Sham.program_description}
end


################################################################################
# Workout Plans
WORKOUT_PLAN_NAME = "workout_plan_"
WORKOUT_PLAN_DESCRIPTION = "workout_plan_description_"

# Shams
Sham.workout_plan_name {|index| "#{WORKOUT_PLAN_NAME}#{index}"}
Sham.workout_plan_description {|index| "#{WORKOUT_PLAN_DESCRIPTION}#{index}"}

# Builders
WorkoutPlan.blueprint do
  name {Sham.workout_plan_name}
  description {Sham.workout_plan_description}
end