class User < ActiveRecord::Base
  enum role: [:user, :fs,:manager,:admin]
  after_initialize :set_default_role, :if => :new_record?
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  def isAdmin
    self.admin?
  end
  private
##First User in the Database is an admin, rest defaults to user
  def set_default_role
    if User.count == 0
      self.role ||= :admin
    else
      self.role ||= :user
    end
  end
end
