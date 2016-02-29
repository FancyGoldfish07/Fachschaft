class BuildPolicy < ApplicationPolicy
  def initialize(current_user, model)
    @current_user = current_user

  end
  def show?
    @current_user.isAdmin || @current_user.isFachschaft
  end
  def update?
    @current_user.isAdmin || @current_user.isFachschaft
  end
  def new?
    @current_user.isAdmin || @current_user.isFachschaft
  end
end
