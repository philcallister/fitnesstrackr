class StrengthPlansController < ApplicationController
  
  before_filter :find_workout_plan, :only => [:new, :create]
  before_filter :find_strength_plan, :only => [:show, :edit, :update, :destroy]

  # GET /strength_plans/1
  # GET /strength_plans/1.xml
  def show
    @workout_plan = @strength_plan.workout_plans.first
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @strength_plan }
    end
  end

  # GET /strength_plans/new
  # GET /strength_plans/new.xml
  def new
    @strength_plan = StrengthPlan.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @strength_plan }
    end
  end

  # GET /strength_plans/1/edit
  def edit
    @workout_plan = @strength_plan.workout_plans.first
    # edit.html.erb
  end

  # POST /strength_plans
  # POST /strength_plans.xml
  def create
    @strength_plan = StrengthPlan.new(params[:strength_plan])
    @strength_plan.workout_plans << @workout_plan

    respond_to do |format|
      if @strength_plan.save
        flash[:notice] = 'Strength Plan was successfully created.'
        format.html { redirect_to workout_plan_strength_plan_path(@workout_plan, @strength_plan) }
        format.xml  { render :xml => @strength_plan, :status => :created, :location => @strength_plan }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @strength_plan.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /strength_plans/1
  # PUT /strength_plans/1.xml
  def update
    respond_to do |format|
      if @strength_plan.update_attributes(params[:strength_plan])
        flash[:notice] = 'Strength Plan was successfully updated.'
        if @workout_plan
          format.html { redirect_to workout_plan_strength_plan_path(@workout_plan, @strength_plan) }
        else
          format.html { redirect_to(@strength_plan) }
        end
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @strength_plan.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /strength_plans/1
  # DELETE /strength_plans/1.xml
  def destroy
    workout_plan = @strength_plan.workout_plans.first
    @strength_plan.destroy

    respond_to do |format|
      format.html { redirect_to(workout_plan_exercise_plans_url(workout_plan)) }
      format.xml  { head :ok }
    end
  end


  private

  def find_workout_plan
    if params[:workout_plan_id]
      @workout_plan = WorkoutPlan.find(params[:workout_plan_id])
    elsif params[:strength_plan][:workout_plan_id]
      @workout_plan = WorkoutPlan.find(params[:strength_plan][:workout_plan_id])
    end
  end

  def find_strength_plan
    if params[:id]
      @strength_plan = StrengthPlan.find(params[:id])
    end
  end
end
