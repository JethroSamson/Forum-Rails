class UserMailer < ApplicationMailer
  default from: "forum.com"

  def signup_confirmation(user)
    @signup = user
    mail to: user.email, subject: "Sign Up"
  end
end
