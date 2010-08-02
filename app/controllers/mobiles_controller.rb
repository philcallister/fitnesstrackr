class MobilesController < ApplicationController

  before_filter :require_user
  before_filter :find_exercise_plan, :only => [:show]

  def index
    # TODO: Select correct workout plan
    program = current_user.programs.first
    @workout_block = program.workout_blocks.first
    @workout_plan = @workout_block.workout_plans.first
    @exercise_plans = @workout_plan.exercise_plans
    respond_to do |format|
      format.touch { render :action => "index" }
    end
  end

  def show
    if @exercise_plan
      if @exercise_plan.exercise.kind == Exercise::STRENGTH
        @strength_plan_sets = @exercise_plan.strength_plan_sets
      end
    end
    respond_to do |format|
      format.touch { render :action => "show" }
    end
  end

  private

  def find_exercise_plan
    if params[:id]
      @exercise_plan =  ExercisesWorkoutPlan.find(params[:id]).exercise_plan
    end
  end
  
end
