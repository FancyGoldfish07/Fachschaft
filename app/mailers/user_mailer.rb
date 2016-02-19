class UserMailer < ApplicationMailer

  def signup_confirmation(user)
    @user = user

    mail to: user.email, subject: "Fachschaft signup confirmation"
  end

  def role_change_confirmation(user)
    @user = user
    mail to: user.email, subject: "User changed has been role"
  end

  def password_changed(user)
    @user = user
    mail to: user.email, subject: "Your Password has been updated"
  end

  def delete_account(user)
    @user = user
    mail to: user.email, subject: "Your Account has been deleted"
  end
end
