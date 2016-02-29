class NewsletterPolicy < ApplicationPolicy
  def initialize(current_user, model)
    @current_user = current_user
    @newsletter = model
  end

  def new?
    #Only allow new newsletter by manager
    @current_user.isManager
  end
  def edit?
    @current_user.isManager
  end
  def review?
    @current_user.isAdmin
  end

  def  publishables?
    @current_user.isAdmin
  end
end