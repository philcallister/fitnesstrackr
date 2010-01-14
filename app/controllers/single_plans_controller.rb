class SinglePlansController < ApplicationController

  before_filter :find_workout_plan, :only => [:new, :create, :edit, :update, :show]

  # GET /single_plans/1
  # GET /single_plans/1.xml
  def show
    @single_plan = SinglePlan.find(params[:id])

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
    @single_plan = SinglePlan.find(params[:id])
  end

  # POST /strength_plans
  # POST /strength_plans.xml
  def create
    @single_plan = SinglePlan.new(params[:single_plan])
    @single_plan.workout_plans << @workout_plan

    respond_to do |format|
      if @single_plan.save
        flash[:notice] = 'SinglePlan was successfully created.'
        format.html { redirect_to workout_plan_single_plan_path(@workout_plan, @single_plan) }
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
    @single_plan = SinglePlan.find(params[:id])

    respond_to do |format|
      if @single_plan.update_attributes(params[:single_plan])
        flash[:notice] = 'SinglePlan was successfully updated.'
        if @workout_plan
          format.html { redirect_to workout_plan_single_plan_path(@workout_plan, @single_plan) }
        else
          format.html { redirect_to(@single_plan) }
        end
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @single_plan.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /single_plans/1
  # DELETE /single_plans/1.xml
  def destroy
    @single_plan = SinglePlan.find(params[:id])
    @single_plan.destroy

    respond_to do |format|
      format.html { redirect_to(single_plans_url) }
      format.xml  { head :ok }
    end
  end


  private

  def find_workout_plan
    if params[:workout_plan_id]
      @workout_plan = WorkoutPlan.find(params[:workout_plan_id])
    end
  end

end
