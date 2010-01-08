class WorkoutPlansController < ApplicationController

  before_filter :find_program, :only => [:index, :new]
  before_filter :find_workout_plans, :only => [:index]

  # GET /workout_plans
  # GET /workout_plans.xml
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @workout_plans }
    end
  end

  # GET /workout_plans/1
  # GET /workout_plans/1.xml
  def show
    @workout_plan = WorkoutPlan.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @workout_plan }
    end
  end

  # GET /workout_plans/new
  # GET /workout_plans/new.xml
  def new
    @workout_plan = WorkoutPlan.new
    @workout_plan.program = @program

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @workout_plan }
    end
  end

  # GET /workout_plans/1/edit
  def edit
    @workout_plan = WorkoutPlan.find(params[:id])
  end

  # POST /workout_plans
  # POST /workout_plans.xml
  def create
    @workout_plan = WorkoutPlan.new(params[:workout_plan])

    respond_to do |format|
      if @workout_plan.save
        flash[:notice] = 'WorkoutPlan was successfully created.'
        format.html { redirect_to(@workout_plan) }
        format.xml  { render :xml => @workout_plan, :status => :created, :location => @workout_plan }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @workout_plan.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /workout_plans/1
  # PUT /workout_plans/1.xml
  def update
    @workout_plan = WorkoutPlan.find(params[:id])

    respond_to do |format|
      if @workout_plan.update_attributes(params[:workout_plan])
        flash[:notice] = 'WorkoutPlan was successfully updated.'
        format.html { redirect_to(@workout_plan) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @workout_plan.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /workout_plans/1
  # DELETE /workout_plans/1.xml
  def destroy
    @workout_plan = WorkoutPlan.find(params[:id])
    @workout_plan.destroy

    respond_to do |format|
      format.html { redirect_to(workout_plans_url) }
      format.xml  { head :ok }
    end
  end


  private

  def find_program
    if params[:program_id]
      @program = Program.find(params[:program_id])
    end
  end

  def find_workout_plans
    if params[:program_id]
      @workout_plans = WorkoutPlan.find_all_by_program_id(params[:program_id])
    else
      @workout_plans = []
    end
  end
end
