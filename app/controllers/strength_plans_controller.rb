class StrengthPlansController < ApplicationController
  
  before_filter :find_workout_plan, :only => [:new, :create]
  before_filter :find_strength_plan, :only => [:show, :edit, :update, :destroy]
  before_filter :find_strength_exercises, :only => [:new, :edit]

  # GET /strength_plans/1
  # GET /strength_plans/1.xml
  def show
    @workout_plan = @strength_plan.workout_plans.first
    @workout_block = @workout_plan.workout_block
    @program = @workout_block.program
    respond_to do |format|
      format.html { render :template => 'programs/index' }
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
    # edit.html.erb
  end

  # POST /strength_plans
  # POST /strength_plans.xml
  def create
    @strength_plan = StrengthPlan.new(params[:strength_plan])
    @strength_plan.workout_plans << @workout_plan

    respond_to do |format|
      unless params[:commit] == 'Cancel'
        if @strength_plan.save
          flash[:notice] = 'Strength Plan was successfully created.'
          format.html { redirect_to(@strength_plan) }
          format.xml  { render :xml => @strength_plan, :status => :created, :location => @strength_plan }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @strength_plan.errors, :status => :unprocessable_entity }
        end
      else
        format.html { redirect_to programs_path }
        format.xml  { head :ok }
      end
    end
  end

  # PUT /strength_plans/1
  # PUT /strength_plans/1.xml
  def update
    if params[:move_up] || params[:move_down]
      update_move
    else
      update_all
    end
  end

  # DELETE /strength_plans/1
  # DELETE /strength_plans/1.xml
  def destroy
    @workout_plan = @strength_plan.workout_plans.first
    @workout_block = @workout_plan.workout_block
    @program = @workout_block.program
    @strength_plan.destroy
    respond_to do |format|
      format.html { render :template => 'programs/index' }
      format.xml  { render head :ok }
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

  def find_strength_exercises
    @exercises = Exercise.find_all_by_kind(Exercise::STRENGTH)
  end

  def update_all
    respond_to do |format|
      unless params[:commit] == 'Cancel'
        if @strength_plan.update_attributes(params[:strength_plan])
          flash[:notice] = 'Strength Plan was successfully updated.'
          format.html { redirect_to(@strength_plan) }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @strength_plan.errors, :status => :unprocessable_entity }
        end
      else
        format.html { redirect_to programs_path }
        format.xml  { head :ok }
      end
    end
  end

  def update_move
    if params[:move_up]
      @strength_plan.exercises_workout_plans.first.move_higher
    else
      @strength_plan.exercises_workout_plans.first.move_lower
    end
    flash[:notice] = 'Strength Plan was successfully moved.'
    respond_to do |format|
      format.html { redirect_to(workout_plan_exercise_plans_path(@strength_plan.workout_plans.first)) }
      format.xml  { head :ok }
    end
  end

end
