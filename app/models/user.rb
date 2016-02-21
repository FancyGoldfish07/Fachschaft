##
#User model
#
class User < ActiveRecord::Base
  #Use rolify
  rolify

  #after a new user is created set new role
  after_save :set_default_role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # after_create :send_signup_confirmation

  # def send_signup_confirmation
   # UserMailer.signup_confirmation(self).deliver
  # end

  #sets the Role of the user. Works only if roleName is part of Role.POSSIBLE_ROLES
  def setRole(roleName)
    #Is the role part of possible roles
    if Role.POSSIBLE_ROLES.include? roleName
      #Remove roles
      self.roles = []
      #Add role
      self.add_role roleName
      # If user already exists send Info about role change, else send signup confirmation
      if (User.exists?(self))
        #UserMailer.role_change_confirmation(self).deliver
      else
        #UserMailer.signup_confirmation(self).deliver
      end
      return true
    else

      false
    end
  end

  #Checks if the current user is an admin
  #returns a boolean
  def isAdmin
    self.has_role? Role.Admin
  end

  #Returns the name of the current role
  def current_role
    self.roles[0].toString
  end

  private
  ##
  #First User in the Database is an admin, rest defaults to user
  #
  def set_default_role
    if User.count == 0
      setRole Role.Admin
    else
      setRole Role.User
    end
  end
end
