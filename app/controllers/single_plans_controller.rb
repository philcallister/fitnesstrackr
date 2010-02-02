class SinglePlansController < ApplicationController

  before_filter :find_workout_plan, :only => [:new, :create]
  before_filter :find_single_plan, :only => [:show, :edit, :update, :destroy]

  # GET /single_plans/1
  # GET /single_plans/1.xml
  def show
    @workout_plan = @single_plan.workout_plans.first
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @single_plan }
    end
  end

  # GET /single_plans/new
  # GET /single_plans/new.xml
  def new
    @single_plan = SinglePlan.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @single_plan }
    end
  end

  # GET /single_plans/1/edit
  def edit
    @workout_plan = @single_plan.workout_plans.first
    # edit.html.erb
  end

  # POST /single_plans
  # POST /single_plans.xml
  def create
    @single_plan = SinglePlan.new(params[:single_plan])
    @single_plan.workout_plans << @workout_plan

    respond_to do |format|
      if @single_plan.save
        flash[:notice] = 'Sinlge Plan was successfully created.'
        format.html { redirect_to(@single_plan) }
        format.xml  { render :xml => @single_plan, :status => :created, :location => @single_plan }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @single_plan.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /single_plans/1
  # PUT /single_plans/1.xml
  def update
    if params[:move_up] || params[:move_down]
      update_move
    else
      update_all
    end
  end

  # DELETE /single_plans/1
  # DELETE /single_plans/1.xml
  def destroy
    workout_plan = @single_plan.workout_plans.first
    @single_plan.destroy

    respond_to do |format|
      format.html { redirect_to(workout_plan_exercise_plans_url(workout_plan)) }
      format.xml  { head :ok }
    end
  end


  private

  def find_workout_plan
    if params[:workout_plan_id]
      @workout_plan = WorkoutPlan.find(params[:workout_plan_id])
    elsif params[:single_plan][:workout_plan_id]
      @workout_plan = WorkoutPlan.find(params[:single_plan][:workout_plan_id])
    end
  end

  def find_single_plan
    if params[:id]
      @single_plan = SinglePlan.find(params[:id])
    end
  end

  def update_all
    @workout_plan = @single_plan.workout_plans.first
    respond_to do |format|
      if @single_plan.update_attributes(params[:single_plan])
        flash[:notice] = 'Single Plan was successfully updated.'
        format.html { redirect_to(@single_plan) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @single_plan.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update_move
    if params[:move_up]
      @single_plan.exercises_workout_plans.first.move_higher
    else
      @single_plan.exercises_workout_plans.first.move_lower
    end
    flash[:notice] = 'Single Plan was successfully moved.'
    respond_to do |format|
      format.html { redirect_to(workout_plan_exercise_plans_path(@single_plan.workout_plans.first)) }
      format.xml  { head :ok }
    end
  end

end
