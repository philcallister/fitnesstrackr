class CardioPlansController < ApplicationController
  
  before_filter :find_workout_plan, :only => [:new, :create]
  before_filter :find_cardio_plan, :only => [:show, :edit, :update, :destroy]

  # GET /cardio_plans/1
  # GET /cardio_plans/1.xml
  def show
    @workout_plan = @cardio_plan.workout_plans.first
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cardio_plan }
    end
  end

  # GET /cardio_plans/new
  # GET /cardio_plans/new.xml
  def new
    @cardio_plan = CardioPlan.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cardio_plan }
    end
  end

  # GET /cardio_plans/1/edit
  def edit
    @workout_plan = @cardio_plan.workout_plans.first
    # edit.html.erb
  end

  # POST /cardio_plans
  # POST /cardio_plans.xml
  def create
    @cardio_plan = CardioPlan.new(params[:cardio_plan])
    @cardio_plan.workout_plans << @workout_plan

    respond_to do |format|
      if @cardio_plan.save
        flash[:notice] = 'Cardio Plan was successfully created.'
        format.html { redirect_to(@cardio_plan) }
        format.xml  { render :xml => @cardio_plan, :status => :created, :location => @cardio_plan }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cardio_plan.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cardio_plans/1
  # PUT /cardio_plans/1.xml
  def update
    if params[:move_up] || params[:move_down]
      update_move
    else
      update_all
    end
  end

  # DELETE /cardio_plans/1
  # DELETE /cardio_plans/1.xml
  def destroy
    workout_plan = @cardio_plan.workout_plans.first
    @cardio_plan.destroy

    respond_to do |format|
      format.html { redirect_to(workout_plan_exercise_plans_url(workout_plan)) }
      format.xml  { head :ok }
    end
  end


  private

  def find_workout_plan
    if params[:workout_plan_id]
      @workout_plan = WorkoutPlan.find(params[:workout_plan_id])
    elsif params[:cardio_plan][:workout_plan_id]
      @workout_plan = WorkoutPlan.find(params[:cardio_plan][:workout_plan_id])
    end
  end

  def find_cardio_plan
    if params[:id]
      @cardio_plan = CardioPlan.find(params[:id])
    end
  end

  def update_all
    @workout_plan = @cardio_plan.workout_plans.first
    respond_to do |format|
      if @cardio_plan.update_attributes(params[:cardio_plan])
        flash[:notice] = 'Cardio Plan was successfully updated.'
        format.html { redirect_to(@cardio_plan) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cardio_plan.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update_move
    if params[:move_up]
      @cardio_plan.exercises_workout_plans.first.move_higher
    else
      @cardio_plan.exercises_workout_plans.first.move_lower
    end
    flash[:notice] = 'Cardio Plan was successfully moved.'
    respond_to do |format|
      format.html { redirect_to(workout_plan_exercise_plans_path(@cardio_plan.workout_plans.first)) }
      format.xml  { head :ok }
    end
  end

end
