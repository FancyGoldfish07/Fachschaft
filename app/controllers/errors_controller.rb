#Error controller
#Adapted from http://jerodsanto.net/2014/06/a-step-by-step-guide-to-bulletproof-404s-on-rails/
class ErrorsController < ApplicationController
  layout "error"
  def not_found
    respond_to do |format|
      format.html { render status: 404 }
    end
  rescue ActionController::UnknownFormat
    render status: 404, text: "Hier ist nichts, nur weites nichts."
  end
end