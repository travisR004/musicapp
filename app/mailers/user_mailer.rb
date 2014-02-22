class UserMailer < ActionMailer::Base
  default from: "authentication@musicinventory.com"

  def activation_email(user)
    @user = user
    @url = activate_users_url(activation_token: @user.activation_token)
    mail(to: user.email, subject: "Activate Your Account")
  end
end
