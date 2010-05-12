class AnalyzesController < ApplicationController

  before_filter :require_user
  before_filter :find_measurement_type

  def index
    # index.html.erb
  end


  private

  def find_measurement_type
    @measurement_type = params[:mt].to_i if params[:mt]
  end

end
