class ApplicationController < ActionController::Base
  #Pundit included
  include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #Rescue us from Pundit
  rescue_from Pundit::NotAuthorizedError, with: :permission_denied
  rescue_from Pundit::NotDefinedError, with: :permission_denied
  private
  #redirects the bad boy to root or the refererer
  def permission_denied
    flash[:error] = "Da haben wir einen Riegel vorgeschoben und zwar keinen Schokoriegel!"

    redirect_to(request.referrer || root_path)
  end
end
