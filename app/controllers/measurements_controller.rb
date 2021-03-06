class MeasurementsController < ApplicationController

  before_filter :require_user
  before_filter :find_measurement, :only => [:show, :edit, :update, :destroy]

  # GET /measurements
  # GET /measurements.xml
  def index
    @measurements = current_user.nil? ? nil : current_user.measurements
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
    new_measurement = false
    if params[:measure_date]
      @measurement = current_user.measurements.find_date(Date.parse(params[:measure_date]))
      unless @measurement
        @measurement = (current_user.measurements.recent) ? current_user.measurements.recent.clone :
                                                            Measurement.new
        @measurement.measure_date = Date.parse(params[:measure_date])
        new_measurement = true
      end
    elsif current_user.measurements.recent
      @measurement = current_user.measurements.recent
    else
      @measurement = (current_user.measurements.recent) ? current_user.measurements.recent.clone :
                                                          Measurement.new
      new_measurement = true
    end

    respond_to do |format|
      if new_measurement
        format.html # new.html.erb
        format.xml  { render :xml => @measurement }
      else
        format.html { render :action => :edit }
        format.xml  { render :xml => @measurement }
      end
    end
  end

  # GET /measurements/1/edit
  def edit
    # edit.html.erb
  end

  # POST /measurements
  # POST /measurements.xml
  def create
    unless current_user.measurements.find_date(params[:measure_date]).nil?
      update_all
    else
      @measurement = Measurement.new(params[:measurement])
      @measurement.user = current_user
      respond_to do |format|
        unless params[:commit] == 'Cancel'
          if @measurement.save
            flash[:notice] = 'Measurement was successfully created.'
            format.html { redirect_to dashboards_path }
            format.xml  { render :xml => @measurement, :status => :created, :location => @measurement }
          else
            format.html { render :action => "new" }
            format.xml  { render :xml => @measurement.errors, :status => :unprocessable_entity }
          end
        else
          format.html { redirect_to dashboards_path }
          format.xml  { head :ok }
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

  def find_measurement
    if params[:id]
      @measurement = Measurement.find(params[:id])
    end
  end

  def update_all
    respond_to do |format|
      unless params[:commit] == 'Cancel'
        if @measurement.update_attributes(params[:measurement])
          flash[:notice] = 'Measurement was successfully updated.'
          format.html { redirect_to dashboards_path }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @measurement.errors, :status => :unprocessable_entity }
        end
      else
        format.html { redirect_to dashboards_path }
        format.xml  { head :ok }
      end
    end
  end

end
