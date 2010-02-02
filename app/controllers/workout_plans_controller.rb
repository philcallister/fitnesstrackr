class WorkoutPlansController < ApplicationController

  before_filter :find_workout_block, :only => [:index, :new, :create]
  before_filter :find_workout_plan, :only => [:show, :edit, :update, :destroy]

  # GET /workout_plans
  # GET /workout_plans.xml
  def index
    @workout_plans = @workout_block.nil? ? nil : @workout_block.workout_plans
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @workout_plans }
    end
  end

  # GET /workout_plans/1
  # GET /workout_plans/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @workout_plan }
    end
  end

  # GET /workout_plans/new
  # GET /workout_plans/new.xml
  def new
    @workout_plan = WorkoutPlan.new
    @workout_plan.workout_block = @workout_block

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @workout_plan }
    end
  end

  # GET /workout_plans/1/edit
  def edit
    # edit.html.erb
  end

  # POST /workout_plans
  # POST /workout_plans.xml
  def create
    @workout_plan = WorkoutPlan.new(params[:workout_plan])

    respond_to do |format|
      if @workout_plan.save
        flash[:notice] = 'Workout Plan was successfully created.'
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
    if params[:move_up] || params[:move_down]
      update_move
    else
      update_all
    end
  end

  # DELETE /workout_plans/1
  # DELETE /workout_plans/1.xml
  def destroy
    workout_block = @workout_plan.workout_block
    @workout_plan.destroy

    respond_to do |format|
      format.html { redirect_to(workout_block_workout_plans_url(workout_block)) }
      format.xml  { head :ok }
    end
  end


  private

  def find_workout_block
    if params[:workout_block_id]
      @workout_block = WorkoutBlock.find(params[:workout_block_id])
    elsif params[:workout_plan][:workout_block_id]
      @workout_block = WorkoutBlock.find(params[:workout_plan][:workout_block_id])
    end
  end

  def find_workout_plan
    if params[:id]
      @workout_plan = WorkoutPlan.find(params[:id])
    end
  end

  def update_all
    respond_to do |format|
      if @workout_plan.update_attributes(params[:workout_plan])
        flash[:notice] = 'Workout Plan was successfully updated.'
        format.html { redirect_to(@workout_plan) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @workout_plan.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update_move
    if params[:move_up]
      @workout_plan.move_higher
    else
      @workout_plan.move_lower
    end
    flash[:notice] = 'Workout Plan was successfully moved.'
    respond_to do |format|
      format.html { redirect_to(workout_block_workout_plans_path(@workout_plan.workout_block)) }
      format.xml  { head :ok }
    end
  end

end
