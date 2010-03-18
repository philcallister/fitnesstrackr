class UsersController < ApplicationController

  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]
  before_filter :find_account_type, :only => [:show, :edit, :new]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Account registered"
      redirect_back_or_default dashboards_url # TODO: Create initial welcome page
    else
      render :action => :new
    end
  end

  def show
    @user = @current_user
  end

  def edit
    @user = @current_user
  end

  def update
    @user = @current_user # makes our views "cleaner" and more consistent
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated"
      redirect_to dashboards_url
    else
      render :action => :edit
    end
  end


  private

  def find_account_type
    if params[:at]
      @account_type = params[:at].to_i
    else
      @account_type = User::ALL
    end
  end

end
