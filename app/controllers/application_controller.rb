class ApplicationController < ActionController::Base
  #Pundit included
  include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  #Set paper trail up for devise
  before_filter :set_paper_trail_whodunnit

  #Rescue us from Pundit
  rescue_from Pundit::NotAuthorizedError, with: :permission_denied
  rescue_from Pundit::NotDefinedError, with: :permission_denied

  private
  #redirects the bad boy to root or the refererer
  def permission_denied
    flash[:error] = "Da haben wir einen Riegel vorgeschoben und zwar keinen Schokoriegel!"

    redirect_to(request.referrer || root_path)
  end
  #Allow us to have a username
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
  end

  end

