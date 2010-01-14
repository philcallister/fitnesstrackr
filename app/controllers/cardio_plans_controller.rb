class CardioPlansController < ApplicationController
  
  before_filter :find_workout_plan, :only => [:new, :create, :edit, :update, :show]

  # GET /cardio_plans/1
  # GET /cardio_plans/1.xml
  def show
    @cardio_plan = CardioPlan.find(params[:id])

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

  # GET /cardko_plans/1/edit
  def edit
    @cardio_plan = CardioPlan.find(params[:id])
  end

  # POST /cardio_plans
  # POST /cardio_plans.xml
  def create
    @cardio_plan = CardioPlan.new(params[:cardio_plan])
    @cardio_plan.workout_plans << @workout_plan

    respond_to do |format|
      if @cardio_plan.save
        flash[:notice] = 'CardioPlan was successfully created.'
        format.html { redirect_to workout_plan_cardio_plan_path(@workout_plan, @cardio_plan) }
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
    @cardio_plan = CardioPlan.find(params[:id])

    respond_to do |format|
      if @cardio_plan.update_attributes(params[:cardio_plan])
        flash[:notice] = 'CardioPlan was successfully updated.'
        if @workout_plan
          format.html { redirect_to workout_plan_cardio_plan_path(@workout_plan, @cardio_plan) }
        else
          format.html { redirect_to(@cardio_plan) }
        end
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cardio_plan.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cardio_plans/1
  # DELETE /cardio_plans/1.xml
  def destroy
    @cardio_plan = CardioPlan.find(params[:id])
    @cardio_plan.destroy

    respond_to do |format|
      format.html { redirect_to(cardio_plans_url) }
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
