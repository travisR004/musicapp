class UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.activation_email(@user).deliver!
      redirect_to bands_url
    else
      flash.now[:error] = @user.errors.full_messages
      render :new
    end
  end

  def activate
    @user = User.find_by(activation_token: params[:activation_token])
    if @user
      @user.activate!
      login!
      redirect_to '/'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
