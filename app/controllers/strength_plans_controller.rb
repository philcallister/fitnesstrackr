class StrengthPlansController < ApplicationController
  
  before_filter :find_workout_plan, :only => [:new, :create, :edit, :update, :show]

  # GET /strength_plans/1
  # GET /strength_plans/1.xml
  def show
    @strength_plan = StrengthPlan.find(params[:id])

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
    @strength_plan = StrengthPlan.find(params[:id])
  end

  # POST /strength_plans
  # POST /strength_plans.xml
  def create
    @strength_plan = StrengthPlan.new(params[:strength_plan])
    @strength_plan.workout_plans << @workout_plan

    respond_to do |format|
      if @strength_plan.save
        flash[:notice] = 'StrengthPlan was successfully created.'
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
    @strength_plan = StrengthPlan.find(params[:id])

    respond_to do |format|
      if @strength_plan.update_attributes(params[:strength_plan])
        flash[:notice] = 'StrengthPlan was successfully updated.'
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
    @strength_plan = StrengthPlan.find(params[:id])
    @strength_plan.destroy

    respond_to do |format|
      format.html { redirect_to(strength_plans_url) }
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
