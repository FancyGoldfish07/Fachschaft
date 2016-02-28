##
#User model
#
class User < ActiveRecord::Base
  #Use rolify
  rolify

  #A user has created an event_version
  has_many :event_versions

  #after a new user is created set new role
  after_initialize :set_default_role, :if => :new_record?

  after_create :notify_signup
  before_destroy :notify_delete

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #We need a username and a username should be unique
  validates :username, :email, presence: true

  #It is necessary to sign up with a unique email and username
  validates :email, :username, uniqueness: true

  #No email as username
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  #sets the Role of the user. Works only if roleName is part of Role.POSSIBLE_ROLES

  def notify_signup
    UserMailer.signup_confirmation(self).deliver_later
  end

  def notify_update
    UserMailer.role_change_confirmation(self).deliver_later
  end

  def notify_delete
    UserMailer.delete_account(self).deliver_later
  end

  def setRole(roleName)
    #Is the role part of possible roles
    if Role.POSSIBLE_ROLES.include? roleName
      #Remove roles
      self.roles = []
      #Add role
      self.add_role roleName
      return true
    else

      false
    end
  end
  #Checks if the current user is an admin
  def isUser
    self.has_role? Role.User
  end
  #returns a boolean
  def isAdmin
    self.has_role? Role.Admin
  end
  #Is this a Fachschaft user
  def isFachschaft
    self.has_role? Role.Fachschaft
  end
  #Is this a manager
  def isManager
    self.has_role? Role.Manager
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