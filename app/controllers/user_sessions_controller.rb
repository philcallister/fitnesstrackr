class UserSessionsController < ApplicationController
  #before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy

  def new
    @user_session = (current_user_session) ? current_user_session : UserSession.new
    respond_to do |format|
      format.touch { render :action => "new" }
      format.android { render :action => "new" }
      format.html { render :action => "new" }
    end
  end

  def create
    current_user_session.destroy if current_user_session
    @user_session = UserSession.new(params[:user_session])
    respond_to do |format|
      if @user_session.save
        format.touch {redirect_back_or_default mobiles_landing_url(:format => "touch")}
        format.android {redirect_back_or_default mobiles_landing_url(:format => "android")}
        format.html do
          flash[:notice] = "Sign In successful"
          redirect_back_or_default dashboards_url
        end
      else
        format.touch { render :action => "new" }
        format.android { render :action => "new" }
        format.html { render :action => "new" }
      end
    end
  end

  def destroy
    current_user_session.destroy
    respond_to do |format|
      format.touch do
        @user_session = UserSession.new
        render :template => "user_sessions/destroy", :format => "touch", :layout => false
      end
      format.android do
        @user_session = UserSession.new
        render :template => "user_sessions/destroy", :format => "touch", :layout => false
      end
      format.html do
        flash[:notice] = "Sign Out successful"
        redirect_back_or_default new_user_session_url
      end
    end
  end
end
