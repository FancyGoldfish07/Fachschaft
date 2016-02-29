class EventCategoryPolicy < ApplicationPolicy
  def initialize(current_user, model)
    @current_user = current_user
    @event_category = model
  end
  def new?
    @current_user.present? && @current_user.isAdmin
  end
  def edit?
    @current_user.present? && @current_user.isAdmin
  end
  def destroy?
    @current_user.present? && @current_user.isAdmin
  end
  def update?
    @current_user.present? && @current_user.isAdmin
  end
  def index?
   @current_user.present? && @current_user.isAdmin
  end
end