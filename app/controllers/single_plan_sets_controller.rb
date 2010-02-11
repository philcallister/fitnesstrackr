class SinglePlanSetsController < ApplicationController

  before_filter :find_single_plan, :only => [:index, :new, :create]
  before_filter :find_single_plan_set, :only => [:show, :edit, :update, :destroy]

  # GET /single_set_plans
  # GET /single_set_plans.xml
  def index
    @single_plan_sets = @single_plan.nil? ? nil : @single_plan.single_plan_sets
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @single_plan_sets }
    end
  end

  # GET /single_plan_sets/1
  # GET /single_plan_sets/1.xml
  def show
    @single_plan_set = @single_plan.workout_plans.first
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @single_plan_set }
    end
  end

  # GET /single_plan_sets/new
  # GET /single_plan_sets/new.xml
  def new
    @single_plan_set = SinglePlanSet.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @single_plan_set }
    end
  end

  # GET /single_plan_sets/1/edit
  def edit
    # edit.html.erb
  end

  # POST /single_plans
  # POST /single_plans.xml
  def create
    @single_plan_set = SinglePlanSet.new(params[:single_plan_set])
    @single_plan_set.single_plan = @single_plan

    respond_to do |format|
      if @single_plan_set.save
        flash[:notice] = 'Single Plan Set was successfully created.'
        format.html { redirect_to(@single_plan_set) }
        format.xml  { render :xml => @single_plan_set, :status => :created, :location => @single_plan_set }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @single_plan_set.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /single_plan_sets/1
  # PUT /single_plan_sets/1.xml
  def update
    respond_to do |format|
      if @single_plan_set.update_attributes(params[:single_plan_set])
        flash[:notice] = 'Single Plan Setwas successfully updated.'
        format.html { redirect_to(@single_plan_set) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @single_plan_set.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /single_plan_sets/1
  # DELETE /single_plan_sets/1.xml
  def destroy
    single_plan = @single_plan_set.single_plan
    @single_plan_set.destroy

    respond_to do |format|
      format.html { redirect_to(single_plan_single_plan_sets_url(single_plan)) }
      format.xml  { head :ok }
    end
  end


  private

  def find_single_plan
    if params[:single_plan_id]
      @single_plan = SinglePlan.find(params[:single_plan_id])
    elsif params[:single_plan_set][:single_plan_id]
      @single_plan = SinglePlan.find(params[:single_plan_set][:single_plan_id])
    end
  end

  def find_single_plan_set
    if params[:id]
      @single_plan_set = SinglePlanSet.find(params[:id])
    end
  end

end
