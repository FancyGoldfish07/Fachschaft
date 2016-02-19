##
#User model
#
class User < ActiveRecord::Base
  rolify


  #User can either be user, fs, manager or admin
  #more info: http://edgeapi.rubyonrails.org/classes/ActiveRecord/Enum.html
  enum role: [:user, :fs,:manager,:admin]
  #after a new user is created set new role
  after_initialize :set_default_role, :if => :new_record?
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #Checks if the current user is an admin
  #returns a boolean
  def isAdmin
    self.admin?
  end
  private
  ##
  #First User in the Database is an admin, rest defaults to user
  #
  def set_default_role
    if User.count == 0
      self.role ||= :admin
    else
      self.role ||= :user
    end
  end
end
