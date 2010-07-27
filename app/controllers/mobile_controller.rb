class MobileController < ApplicationController

  def index
    respond_to do |format|
      format.iphone { render :action => "index" }
    end
  end
end
