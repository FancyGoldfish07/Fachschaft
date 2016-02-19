class UserMailer < ApplicationMailer

  def signup_confirmation(user)
    @user = user

    mail to: user.email, subject: "Fachschaft Signup Confirmation"
  end

  def role_change_confirmation(user)
    @user = user
    mail to: user.email, subject: "User changed role"
  end
end
