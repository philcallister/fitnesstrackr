require 'machinist/active_record'
require 'sham'
require 'forgery'


################################################################################
# Exercise

# Shams
Sham.exercise_name {|index| "exercise_#{index}"}
Sham.exercise_description {|index| "exercise_description_#{index}"}
Sham.exercise_kind(:unique => false) {[:strength, :cardio, :single].random}

# Builders
Exercise.blueprint do
  name {Sham.exercise_name}
  description {Sham.exercise_description}
  kind {Sham.exercise_kind}
end

Exercise.blueprint(:strength) do
  kind {:strength}
end

Exercise.blueprint(:cardio) do
  kind {:cardio}
end

Exercise.blueprint(:single) do
  kind {:single}
end


################################################################################
# Program

# Shams
Sham.program_name {|index| "program_#{index}"}
Sham.program_description {|index| "program_description_#{index}"}

# Builders
Program.blueprint do
  name {Sham.program_name}
  description {Sham.program_description}
end


################################################################################
# Workout Block

# Shams
Sham.workout_block_name {|index| "workout_block_#{index}"}
Sham.workout_block_description {|index| "workout_block_description_#{index}"}

# Builders
WorkoutBlock.blueprint do
  name {Sham.workout_block_name}
  description {Sham.workout_block_description}
  program {Program.make}
end


################################################################################
# Workout Plan

# Shams
Sham.workout_plan_name {|index| "workout_plan_#{index}"}
Sham.workout_plan_description {|index| "workout_plan_description_#{index}"}
Sham.workout_plan_has_pt(:unique => false) {Forgery::Basic.boolean}

# Builders
WorkoutPlan.blueprint do
  name {Sham.workout_plan_name}
  description {Sham.workout_plan_description}
  workout_block {WorkoutBlock.make}
  has_pt {Sham.workout_plan_has_pt}
end


################################################################################
# Exercises Workout Plan

# Sham
Sham.exercises_workout_plan_exercise_plan(:unique => false) {[StrengthPlan, CardioPlan, SinglePlan].random}

# Builders
ExercisesWorkoutPlan.blueprint do
  workout_plan {WorkoutPlan.make}
  exercise_plan {Sham.exercises_workout_plan_exercise_plan.make}
  exercise_plan_type {exercise_plan.to_s}
end


################################################################################
# Cardio Plan

# Shams
Sham.cardio_plan_time(:unique => false) {Forgery::Basic.number(:at_least => 1, :at_most => 120)}
Sham.cardio_plan_level(:unique => false) {Forgery::Basic.number(:at_least => 0, :at_most => 20)}
Sham.cardio_plan_incline(:unique => false) {Forgery::Basic.number(:at_least => 0.0, :at_most => 10.0)}
Sham.cardio_plan_speed(:unique => false) {Forgery::Basic.number(:at_least => 1.0, :at_most => 10.0)}
Sham.cardio_plan_distance(:unique => false) {Forgery::Basic.number(:at_least => 1.00, :at_most => 10.00)}
Sham.cardio_plan_calories(:unique => false) {Forgery::Basic.number(:at_least => 1, :at_most => 1000)}
Sham.cardio_plan_notes {|index| "cardio_plan_notes_#{index}"}
Sham.cardio_plan_hr(:unique => false) {Forgery::Basic.number(:at_least => 70, :at_most => 180)}

# Builders
CardioPlan.blueprint do
  exercise {Exercise.make(:cardio)}
  time {Sham.cardio_plan_time}
  level {Sham.cardio_plan_level}
  incline {Sham.cardio_plan_incline}
  speed {Sham.cardio_plan_speed}
  distance {Sham.cardio_plan_distance}
  calories {Sham.cardio_plan_calories}
  min_hr {Sham.cardio_plan_hr}
  max_hr {Sham.cardio_plan_hr}
  notes {Sham.cardio_plan_notes}
end


################################################################################
# Strength Plan

# Shams
Sham.strength_plan_notes {|index| "strength_plan_notes_#{index}"}

# Builders
StrengthPlan.blueprint do
  exercise {Exercise.make(:strength)}
  notes {Sham.strength_plan_notes}
end


################################################################################
# Strength Plan Set

# Shams
Sham.strength_plan_set_reps(:unique => false) {Forgery::Basic.number(:at_least => 1, :at_most => 20)}
Sham.strength_plan_set_weight(:unique => false) {Forgery::Basic.number(:at_least => 25, :at_most => 225)}

# Builders
StrengthPlanSet.blueprint do
  reps {Sham.strength_plan_set_reps}
  weight {Sham.strength_plan_set_weight}
  strength_plan {StrengthPlan.make}
end


#################################################################################
# Single Plan

# Shams
Sham.single_plan_notes {|index| "single_plan_notes_#{index}"}

# Builders
SinglePlan.blueprint do
  exercise {Exercise.make(:single)}
  notes {Sham.single_plan_notes}
end


################################################################################
# Single Plan Set

# Shams
Sham.single_plan_set_number(:unique => false) {Forgery::Basic.number(:at_least => 1, :at_most => 100)}

# Builders
SinglePlanSet.blueprint do
  number {Sham.single_plan_set_number}
  single_plan {SinglePlan.make}
end


################################################################################
# Workout

# Shams
Sham.workout_notes {|index| "workout_notes_#{index}"}

# Builders
Workout.blueprint do
  notes {Sham.workout_notes}
  workout_plan {WorkoutPlan.make}
end


################################################################################
# Exercises Workout

# Sham
Sham.exercises_workout_exercise(:unique => false) {[Strength, Cardio, Single].random}

# Builders
ExercisesWorkout.blueprint do
  workout {Workout.make}
  exercise {Sham.exercises_workout_exercise.make}
  exercise_type {exercise.to_s}
end


################################################################################
# Cardio

# Shams
Sham.cardio_time(:unique => false) {Forgery::Basic.number(:at_least => 1, :at_most => 120)}
Sham.cardio_level(:unique => false) {Forgery::Basic.number(:at_least => 0, :at_most => 20)}
Sham.cardio_incline(:unique => false) {Forgery::Basic.number(:at_least => 0.0, :at_most => 10.0)}
Sham.cardio_speed(:unique => false) {Forgery::Basic.number(:at_least => 1.0, :at_most => 10.0)}
Sham.cardio_distance(:unique => false) {Forgery::Basic.number(:at_least => 1.00, :at_most => 10.00)}
Sham.cardio_calories(:unique => false) {Forgery::Basic.number(:at_least => 1, :at_most => 1000)}
Sham.cardio_notes {|index| "cardio_notes_#{index}"}
Sham.cardio_hr(:unique => false) {Forgery::Basic.number(:at_least => 70, :at_most => 180)}

# Builders
Cardio.blueprint do
  exercise {Exercise.make(:cardio)}
  time {Sham.cardio_time}
  level {Sham.cardio_level}
  incline {Sham.cardio_incline}
  speed {Sham.cardio_speed}
  distance {Sham.cardio_distance}
  calories {Sham.cardio_calories}
  min_hr {Sham.cardio_hr}
  max_hr {Sham.cardio_hr}
  notes {Sham.cardio_notes}
end


################################################################################
# Strength

# Shams
Sham.strength_notes {|index| "strength_notes_#{index}"}

# Builders
Strength.blueprint do
  exercise {Exercise.make(:strength)}
  notes {Sham.strength_notes}
end


################################################################################
# Strength Set

# Shams
Sham.strength_set_reps(:unique => false) {Forgery::Basic.number(:at_least => 1, :at_most => 20)}
Sham.strength_set_weight(:unique => false) {Forgery::Basic.number(:at_least => 25, :at_most => 225)}

# Builders
StrengthSet.blueprint do
  reps {Sham.strength_set_reps}
  weight {Sham.strength_set_weight}
  strength {Strength.make}
end


#################################################################################
# Single

# Shams
Sham.single_notes {|index| "single_notes_#{index}"}

# Builders
Single.blueprint do
  exercise {Exercise.make(:single)}
  notes {Sham.single_notes}
end


################################################################################
# Single Set

# Shams
Sham.single_set_number(:unique => false) {Forgery::Basic.number(:at_least => 1, :at_most => 100)}

# Builders
SingleSet.blueprint do
  number {Sham.single_set_number}
  single {Single.make}
end