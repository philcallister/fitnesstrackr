class StrengthPlanSetsController < ApplicationController

  before_filter :find_strength_plan, :only => [:index, :new, :create]
  before_filter :find_strength_plan_set, :only => [:show, :edit, :update, :destroy]

  # GET /strength_set_plans
  # GET /strength_set_plans.xml
  def index
    @strength_plan_sets = @strength_plan.nil? ? nil : @strength_plan.strength_plan_sets
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @strength_plan_sets }
    end
  end

  # GET /strength_plan_sets/1
  # GET /strength_plan_sets/1.xml
  def show
    @exercise_plan = @strength_plan_set.strength_plan
    @workout_plan = @exercise_plan.workout_plans.first
    @workout_block = @workout_plan.workout_block
    @program = @workout_block.program
    respond_to do |format|
      format.html { render :template => 'programs/index' }
      format.xml  { render :xml => @strength_plan_set }
   end
  end

  # GET /strength_plan_sets/new
  # GET /strength_plan_sets/new.xml
  def new
    @strength_plan_set = StrengthPlanSet.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @strength_plan_set }
    end
  end

  # GET /strength_plan_sets/1/edit
  def edit
    respond_to do |format|
      format.html # edit.html.erb
      format.touch # edit.touch.erb
    end
  end

  # POST /strength_plans
  # POST /strength_plans.xml
  def create
    @strength_plan_set = StrengthPlanSet.new(params[:strength_plan_set])
    @strength_plan_set.strength_plan = @strength_plan

    respond_to do |format|
      unless params[:commit] == 'Cancel'
        if @strength_plan_set.save
          flash[:notice] = 'Strength Plan Set was successfully created.'
          format.html { redirect_to(@strength_plan_set) }
          format.xml  { render :xml => @strength_plan_set, :status => :created, :location => @strength_plan_set }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @strength_plan_set.errors, :status => :unprocessable_entity }
        end
      else
        format.html { redirect_to programs_path }
        format.xml  { head :ok }
      end
    end
  end

  # PUT /strength_plan_sets/1
  # PUT /strength_plan_sets/1.xml
  def update
    respond_to do |format|
      unless params[:commit] == 'Cancel'
        if @strength_plan_set.update_attributes(params[:strength_plan_set])
          flash[:notice] = 'Strength Plan Set was successfully updated.'
          format.html { redirect_to(@strength_plan_set) }
          format.xml  { head :ok }
          format.touch do
            exercise_plan = @strength_plan_set.strength_plan.exercises_workout_plans.first
            redirect_to mobile_path(exercise_plan)
          end
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @strength_plan_set.errors, :status => :unprocessable_entity }
          format.touch { render :action => "edit" }
        end
      else
        format.html { redirect_to programs_path }
        format.xml  { head :ok }
      end
    end
  end

  # DELETE /strength_plan_sets/1
  # DELETE /strength_plan_sets/1.xml
  def destroy
    @exercise_plan = @strength_plan_set.strength_plan
    @workout_plan = @exercise_plan.workout_plans.first
    @workout_block = @workout_plan.workout_block
    @program = @workout_block.program
    @strength_plan_set.destroy
    respond_to do |format|
      format.html { render :template => 'programs/index' }
      format.xml  { head :ok }
    end
  end


  private

  def find_strength_plan
    if params[:strength_plan_id]
      @strength_plan = StrengthPlan.find(params[:strength_plan_id])
    elsif params[:strength_plan_set][:strength_plan_id]
      @strength_plan = StrengthPlan.find(params[:strength_plan_set][:strength_plan_id])
    end
  end

  def find_strength_plan_set
    if params[:id]
      @strength_plan_set = StrengthPlanSet.find(params[:id])
    end
  end

end
