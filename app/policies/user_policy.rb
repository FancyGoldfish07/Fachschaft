class UserPolicy

  def initialize(current_user, model)
    @current_user = current_user
    @user = model
  end
  def index?
    @current_user.isAdmin
  end
  def update?
    @current_user.isAdmin
  end
  def destroy?
    @current_user == @user || @current_user.isAdmin
  end
end