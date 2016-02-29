class UsersController < ApplicationController
  before_action :set_User, only: [:edit, :update, :destroy]

  def user_params
    params.require(:user).permit(:email, :username)
  end

  def index

    authorize (current_user)
    @users = User.all

  end

  def edit
    authorize(current_user)
  end

  #Only used to update the role of a user
  def update
    authorize(current_user)
    role = params[:user][:role_ids]
 roleModel =Role.find( role)
    if @user.setRole roleModel.name
      @user.save
      redirect_to users_path, :notice => "Rolle geändert"
    else
      redirect_to users_path, :notice => "Rolle nicht geändert"
    end
  end

  def destroy
    authorize (current_user)
    @user.destroy
    if checkAdmin
      # Send confirmation Mail
      redirect_to users_path, :notice => "Nutzer gelöscht"
    else
      redirect_to root_path
    end
  end

  private
  #checks if the currently logged in user is the admin
  def checkAdmin
    current_user.present? && current_user.isAdmin
  end

  #Sets the user we are currently messing with
  def set_User
    @user = User.find(params[:id])
  end

  #Safe params
  def param_check
    params.require(:user).permit(:role_ids)
  end

end