class UserMailer < ActionMailer::Base
  default from: "authentication@musicinventory.com"

  def activation_email(user)
    @user = user
    @url = "localhost:3000/users/activate?activation_token=#{ @user.activation_token}"
    mail(to: user.email, subject: "Activate Your Account")
  end
end
