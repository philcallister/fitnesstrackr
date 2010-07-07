class WorkoutBlocksController < ApplicationController

  before_filter :find_program, :only => [:index, :new, :create]
  before_filter :find_workout_block, :only => [:show, :edit, :update, :destroy]

  # GET /workout_blocks
  # GET /workout_blocks.xml
  def index
    @workout_blocks = @program.nil? ? nil : @program.workout_blocks
    respond_to do |format|
      format.html { render :action => "index" }
      format.xml  { render :xml => @workout_blocks }
    end
  end

  # GET /workout_blocks/1
  # GET /workout_blocks/1.xml
  def show
    @program = @workout_block.program
    respond_to do |format|
      format.html { render :template => 'programs/index' }
      format.xml  { render :xml => @workout_block }
    end
  end

  # GET /workout_blocks/new
  # GET /workout_blocks/new.xml
  def new
    @workout_block = WorkoutBlock.new
    @workout_block.program = @program

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @workout_block }
    end
  end

  # GET /workout_blocks/1/edit
  def edit
    # edit.html.erb
  end

  # POST /workout_blocks
  # POST /workout_blocks.xml
  def create
    @workout_block = WorkoutBlock.new(params[:workout_block])

    respond_to do |format|
      if @workout_block.save
        flash[:notice] = 'Workout Block was successfully created.'
        format.html { redirect_to(@workout_block) }
        format.xml  { render :xml => @workout_block, :status => :created, :location => @workout_block }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @workout_block.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /workout_blocks/1
  # PUT /workout_blocks/1.xml
  def update
    if params[:move_up] || params[:move_down]
      update_move
    else
      update_all
    end
  end

  # DELETE /workout_blocks/1
  # DELETE /workout_blocks/1.xml
  def destroy
    program = @workout_block.program
    @workout_block.destroy

    respond_to do |format|
      format.html { redirect_to(program_workout_blocks_url(program)) }
      format.xml  { head :ok }
    end
  end


  private

  def find_program
    if params[:program_id]
      @program = Program.find(params[:program_id])
    elsif params[:workout_block][:program_id]
      @program = Program.find(params[:workout_block][:program_id])
    end
  end

  def find_workout_block
    if params[:id]
      @workout_block = WorkoutBlock.find(params[:id])
    end
  end

  def update_all
    respond_to do |format|
      if @workout_block.update_attributes(params[:workout_block])
        flash[:notice] = 'Workout Block was successfully updated.'
        format.html { redirect_to(@workout_block) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @workout_block.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update_move
    if params[:move_up]
      @workout_block.move_higher
    else
      @workout_block.move_lower
    end
    flash[:notice] = 'Workout Block was successfully moved.'
    respond_to do |format|
      format.html { redirect_to(program_workout_blocks_path(@workout_block.program)) }
      format.xml  { head :ok }
    end
  end
  
end
