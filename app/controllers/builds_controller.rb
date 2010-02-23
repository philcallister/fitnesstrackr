class BuildsController < ApplicationController

  def index
    @programs = Program.all
  end
  
end
