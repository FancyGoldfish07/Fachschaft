class UserMailer < ApplicationMailer

  def signup_confirmation(user)
    @user = user
    mail(to: user.email, subject: "Registrierung erfolgreich") do |format|
      format.html { render layout: '../../views/user_mailer/signup_confirmation.html.erb' }
      format.text { render text: '../../views/user_mailer/signup_confirmation.text.erb' }

      # @user = user

      # mail to: user.email, subject: "Fachschaft signup confirmation"
    end
  end

  def role_change_confirmation(user)
    @user = user
    mail(to: user.email, subject: "Ihr Profil hat sich geändert") do |format|
      format.html { render layout: '../../views/user_mailer/role_change_confirmation.html.erb' }
      format.text { render text: '../../views/user_mailer/role_change_confirmation.text.erb' }

      # @user = user
      # mail to: user.email, subject: "User changed has been role"
    end
  end

  def password_changed(user)
    @user = user
    mail(to: user.email) do |format|
      format.html { render layout: '../user_mailer/password_changed.html.erb' }
      format.text { render text: '../user_mailer/password_changed.text.erb' }

      # @user = user
      # mail to: user.email, subject: "Your Password has been updated"
    end
  end

  def delete_account(user)
    @user = user
    mail(to: user.email, subject: "Ihr Account wurde gelöscht") do |format|
      format.html { render layout: '../user_mailer/delete_account.html.erb' }
      format.text { render text: '../user_mailer/delete_account.text.erb' }

      # @user = user
      # mail to: user.email, subject: "Your Account has been deleted"
    end
  end
end
