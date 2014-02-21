module SessionsHelper

  def current_user
    return nil if session[:session_token].nil?
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def login!
    session[:session_token] = @user.reset_session_token!
  end

  def logged_in?
    !!current_user
  end

  def logout!
    @user.reset_session_token!
    @user.save!
    session[:session_token] = nil
  end


end
