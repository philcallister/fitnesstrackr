class ExercisePlansController < ApplicationController
  
  before_filter :find_workout_plan, :only => [:index]

  # GET /exercise_plans
  # GET /exercise_plans.xml
  def index
    @exercise_plans = @workout_plan.nil? ? nil : @workout_plan.exercise_plans
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @exercise_plans }
    end
  end

  
  private

  def find_workout_plan
    if params[:workout_plan_id]
      @workout_plan = WorkoutPlan.find(params[:workout_plan_id])
    end
  end

end
