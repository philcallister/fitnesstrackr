class DashboardsController < ApplicationController

  before_filter :require_user

  def index
    @programs = Program.all
  end
  
end
