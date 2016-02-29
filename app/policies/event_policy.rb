class EventPolicy < ApplicationPolicy
  def initialize(current_user, model)
    @current_user = current_user
    @event = model
  end

  def new?
    #Only allow new events to be created by Fachschaft or admin
    @current_user.present? && @current_user.isAdmin ||@current_user.present? && @current_user.isFachschaft
  end
  def edit?
  @current_user.present? &&  @current_user.isAdmin || @current_user.present? && @current_user.isFachschaft
  end
  def review?
    @current_user.present? && @current_user.isAdmin || @current_user.present? && @current_user.isManager
  end

  def unpublish?
    @current_user.present? && @current_user.isAdmin || @current_user.present? && @current_user.isManager
  end
  def permittables?
    @current_user.present? && @current_user.isManager
  end
  def unpublishables?
    @current_user.present? && @current_user.isAdmin || @current_user.present? && @current_user.isManager
  end
  def  publishables?
    @current_user.present? && @current_user.isAdmin
  end
end