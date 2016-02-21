class UserMailer < ApplicationMailer

  def signup_confirmation(user)
    mail(to: user.email) do |format|
      format.html { render layout: '../user_mailer/role_change_confirmation.html.erb' }
      format.text { render text: '../user_mailer/role_change_confirmation.html.erb' }

      # @user = user

      # mail to: user.email, subject: "Fachschaft signup confirmation"
    end
  end

  def role_change_confirmation(user)
    mail(to: user.email) do |format|
      format.html { render layout: '../user_mailer/role_change_confirmation.html.erb' }
      format.text { render text: '../user_mailer/role_change_confirmation.html.erb' }

      # @user = user
      # mail to: user.email, subject: "User changed has been role"
    end
  end

  def password_changed(user)
    mail(to: user.email) do |format|
      format.html { render layout: '../user_mailer/password_changed' }
      format.text { render text: '../user_mailer/password_changed' }

      # @user = user
      # mail to: user.email, subject: "Your Password has been updated"
    end
  end

  def delete_account(user)
    mail(to: user.email) do |format|
      format.html { render layout: '../user_mailer/delete_account' }
      format.text { render text: '../user_mailer/delete_account' }

      # @user = user
      # mail to: user.email, subject: "Your Account has been deleted"
    end
  end
end
