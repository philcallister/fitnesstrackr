class MeasurementsController < ApplicationController

  before_filter :find_user, :only => [:index, :new, :create]
  before_filter :find_measurement, :only => [:show, :edit, :update, :destroy]

  # GET /measurements
  # GET /measurements.xml
  def index
    @measurements = @user.nil? ? nil : @user.measurements
    respond_to do |format|
      format.html { render :action => "index" }
      format.xml  { render :xml => @measurements }
    end
  end

  # GET /measurements/1
  # GET /measurements/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @measurement }
    end
  end

  # GET /measurements/new
  # GET /measurements/new.xml
  #
  # Only create a new measurement if we're on a new day, otherwise just
  # use the measurement from the current day
  def new
    if @user.measurements.current
      @measurement = @user.measurements.current
    else
      @measurement = Measurement.new
      @measurement.user = @user
    end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @measurement }
    end
  end

  # GET /measurements/1/edit
  def edit
    # edit.html.erb
  end

  # POST /measurements
  # POST /measurements.xml
  def create
    if @user.measurements.current
      update_all
    else
      @measurement = Measurement.new(params[:measurement])
      @measurement.measure_date = Date.today
      respond_to do |format|
        if @measurement.save
          flash[:notice] = 'Measurement was successfully created.'
          format.html { redirect_to(@measurement) }
          format.xml  { render :xml => @measurement, :status => :created, :location => @measurement }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @workout_block.errors, :status => :unprocessable_entity }
        end
      end
    end
  end

  # PUT /measurements/1
  # PUT /measurements/1.xml
  def update
    update_all
  end

  # DELETE /measurements/1
  # DELETE /measurements/1.xml
  def destroy
    user = @measurement.user
    @measurement.destroy

    respond_to do |format|
      format.html { redirect_to(user_url(user)) }
      format.xml  { head :ok }
    end
  end


  private

  def find_user
    if params[:user_id]
      @user = User.find(params[:user_id])
    elsif params[:measurement][:user_id]
      @user = User.find(params[:measurement][:user_id])
    end
  end

  def find_measurement
    if params[:id]
      @measurement = Measurement.find(params[:id])
    end
  end

  def update_all
    respond_to do |format|
      if @measurement.update_attributes(params[:measurement])
        flash[:notice] = 'Measurement was successfully updated.'
        format.html { redirect_to(@measurement) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @measurement.errors, :status => :unprocessable_entity }
      end
    end
  end

end
