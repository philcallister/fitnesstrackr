class ProgramsController < ApplicationController
  
  before_filter :find_program, :only => [:show, :edit, :update, :destroy]

  # GET /programs
  # GET /programs.xml
  def index
    @program = current_user.programs.first

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @program }
    end
  end

  # GET /programs/1
  # GET /programs/1.xml
  def show
    respond_to do |format|
      format.html { render :template => 'programs/index' }
      format.xml  { render :xml => @program }
    end
  end

  # GET /programs/new
  # GET /programs/new.xml
  def new
    @program = Program.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @program }
    end
  end

  # GET /programs/1/edit
  def edit
    # edit.html.erb
  end

  # POST /programs
  # POST /programs.xml
  def create
    @program = Program.new(params[:program])
    @program.user = current_user

    respond_to do |format|
      unless params[:commit] == 'Cancel'
        if @program.save
          flash[:notice] = 'Program was successfully created.'
          format.html { redirect_to programs_path }
          format.xml  { render :xml => @program, :status => :created, :location => @program }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @program.errors, :status => :unprocessable_entity }
        end
      else
        format.html { redirect_to programs_path }
        format.xml  { head :ok }
      end
    end
  end

  # PUT /programs/1
  # PUT /programs/1.xml
  def update
    respond_to do |format|
      unless params[:commit] == 'Cancel'
        if @program.update_attributes(params[:program])
          flash[:notice] = 'Program was successfully updated.'
          format.html { redirect_to programs_path }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @program.errors, :status => :unprocessable_entity }
        end
      else
        format.html { redirect_to programs_path }
        format.xml  { head :ok }
      end
    end
  end

  # DELETE /programs/1
  # DELETE /programs/1.xml
  def destroy
    @program.destroy

    respond_to do |format|
      format.html { redirect_to(programs_url) }
      format.xml  { head :ok }
    end
  end


  private

  def find_program
    if params[:id]
      @program = Program.find(params[:id])
    end
  end

end
