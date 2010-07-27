class ExercisePlansController < ApplicationController
  
  before_filter :find_workout_plan, :only => [:index]
  before_filter :find_exercise_plan, :only => [:show]

  # GET /exercise_plans
  # GET /exercise_plans.xml
  def index
    @exercise_plans = @workout_plan.nil? ? nil : @workout_plan.exercise_plans
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @exercise_plans }
    end
  end

  def show
    @workout_plan = @exercise_plan.workout_plans.first
    @workout_block = @workout_plan.workout_block
    @program = @workout_block.program
    respond_to do |format|
      format.html { render :template => 'programs/index' }
      format.xml  { render :xml => @workout_plan }
   end
  end
  

  private

  def find_workout_plan
    if params[:workout_plan_id]
      @workout_plan = WorkoutPlan.find(params[:workout_plan_id])
    end
  end

  def find_exercise_plan
    if params[:id]
      @exercise_plan =  ExercisesWorkoutPlan.find_by_exercise_plan_id(params[:id]).exercise_plan
    end
  end

end
