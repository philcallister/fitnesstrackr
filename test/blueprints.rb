require 'machinist/active_record'
require 'sham'
require 'forgery'

################################################################################
# Program
PROGRAM_NAME = "program_"
PROGRAM_DESCRIPTION = "program_description_"

# Shams
Sham.program_name {|index| "#{PROGRAM_NAME}#{index}"}
Sham.program_name_max {"#{PROGRAM_NAME}#{Forgery::Basic.text(:at_least => 50 - PROGRAM_NAME.length, :at_most => 50 - PROGRAM_NAME.length)}"}
Sham.program_name_over  {"#{PROGRAM_NAME}#{Forgery::Basic.text(:at_least => 51 - PROGRAM_NAME.length, :at_most => 51 - PROGRAM_NAME.length)}"}
Sham.program_description {|index| "#{PROGRAM_DESCRIPTION}#{index}"}
Sham.program_description_max {"#{PROGRAM_DESCRIPTION}#{Forgery::Basic.text(:at_least => 255 - PROGRAM_DESCRIPTION.length, :at_most => 255 - PROGRAM_DESCRIPTION.length)}"}
Sham.program_description_over {"#{PROGRAM_DESCRIPTION}#{Forgery::Basic.text(:at_least => 256 - PROGRAM_DESCRIPTION.length, :at_most => 256 - PROGRAM_DESCRIPTION.length)}"}

# Builders
Program.blueprint do
  name {Sham.program_name}
  description {Sham.program_description}
end

Program.blueprint(:name_max) do
  name {Sham.program_name_max}
  description {Sham.program_description}
end

Program.blueprint(:name_over) do
  name {Sham.program_name_over}
  description {Sham.program_description}
end

Program.blueprint(:name_nil) do
  name {nil}
  description {Sham.program_description}
end

Program.blueprint(:description_max) do
  name {Sham.program_name}
  description {Sham.program_description_max}
end

Program.blueprint(:description_over) do
  name {Sham.program_name}
  description {Sham.program_description_over}
end

Program.blueprint(:description_nil) do
  name {Sham.program_name}
  description {nil}
end

Program.blueprint(:both_max) do
  name {Sham.program_name_max}
  description {Sham.program_description_max}
end

Program.blueprint(:both_over) do
  name {Sham.program_name_over}
  description {Sham.program_description_over}
end

Program.blueprint(:both_nil) do
  name {nil}
  description {nil}
end


################################################################################
# Workout Plans
WORKOUT_PLAN_NAME = "workout_plan_"
WORKOUT_PLAN_DESCRIPTION = "workout_plan_description_"

# Shams
Sham.workout_plan_name {|index| "#{WORKOUT_PLAN_NAME}#{index}"}
Sham.workout_plan_name_max {"#{WORKOUT_PLAN_NAME}#{Forgery::Basic.text(:at_least => 50 - WORKOUT_PLAN_NAME.length, :at_most => 50 - WORKOUT_PLAN_NAME.length)}"}
Sham.workout_plan_name_over {"#{WORKOUT_PLAN_NAME}#{Forgery::Basic.text(:at_least => 51 - WORKOUT_PLAN_NAME.length, :at_most => 51 - WORKOUT_PLAN_NAME.length)}"}
Sham.workout_plan_description {|index| "#{WORKOUT_PLAN_DESCRIPTION}#{index}"}
Sham.workout_plan_description_max {"#{WORKOUT_PLAN_DESCRIPTION}#{Forgery::Basic.text(:at_least => 255 - WORKOUT_PLAN_DESCRIPTION.length, :at_most => 255 - WORKOUT_PLAN_DESCRIPTION.length)}"}
Sham.workout_plan_description_over {"#{WORKOUT_PLAN_DESCRIPTION}#{Forgery::Basic.text(:at_least => 256 - WORKOUT_PLAN_DESCRIPTION.length, :at_most => 256 - WORKOUT_PLAN_DESCRIPTION.length)}"}

# Builders
WorkoutPlan.blueprint do
  name {Sham.workout_plan_name}
  description {Sham.workout_plan_description}
end

WorkoutPlan.blueprint(:name_max) do
  name {Sham.workout_plan_name_max}
  description {Sham.workout_plan_description}
end

WorkoutPlan.blueprint(:name_over) do
  name {Sham.workout_plan_name_over}
  description {Sham.workout_plan_description}
end

WorkoutPlan.blueprint(:name_nil) do
  name {nil}
  description {Sham.workout_plan_description}
end

WorkoutPlan.blueprint(:description_max) do
  name {Sham.workout_plan_name}
  description {Sham.workout_plan_description_max}
end

WorkoutPlan.blueprint(:description_over) do
  name {Sham.workout_plan_name}
  description {Sham.workout_plan_description_over}
end

WorkoutPlan.blueprint(:description_nil) do
  name {Sham.workout_plan_name}
  description {nil}
end

WorkoutPlan.blueprint(:both_max) do
  name {Sham.workout_plan_name_max}
  description {Sham.workout_plan_description_max}
end

WorkoutPlan.blueprint(:both_over) do
  name {Sham.workout_plan_name_over}
  description {Sham.workout_plan_description_over}
end

WorkoutPlan.blueprint(:both_nil) do
  name {nil}
  description {nil}
end
