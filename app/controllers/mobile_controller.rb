class MobileController < ApplicationController

  def index
    # TODO: Select correct workout plan
    program = current_user.programs.first
    @workout_block = program.workout_blocks.first
    @workout_plan = @workout_block.workout_plans.first
    @exercise_plans = @workout_plan.exercise_plans
  end
  
end
