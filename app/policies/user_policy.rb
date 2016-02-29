class UserPolicy < ApplicationPolicy
  attr_reader :current_user, :model
  def initialize(current_user, model)
    @current_user = current_user
    @user = model
  end
  def index?
    @current_user.present? && @current_user.isAdmin
  end
  def update?
    @current_user.present? && @current_user.isAdmin
  end
  def destroy?
    @current_user.present? &&   @current_user == @user ||@current_user.present? && @current_user.isAdmin
  end
end