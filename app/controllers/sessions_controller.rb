class SessionsController < ApplicationController
  before_action :require_logged_out, only: [:new, :create]

  def new
    render :new
  end

  def create
    get_user
    if @user.nil?
      flash.now[:error] = ["Invalid Credentials"]
      render :new
    elsif @user.activated
      login!
      redirect_to "/"
    else
      flash.now[:error] = ["Please Activate Your Account"]
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end


  private
  def get_user
    @user = User.find_by_credentials(params[:user])
  end

  def require_logged_out
    redirect_to root_url if logged_in?
  end
end
