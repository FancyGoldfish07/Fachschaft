#Role model for User
class Role < ActiveRecord::Base
  has_and_belongs_to_many :users, :join_table => :users_roles
  has_and_belongs_to_many :events
  belongs_to :resource, :polymorphic => true

  validates :resource_type,
            :inclusion => { :in => Rolify.resource_types },
            :allow_nil => true

  scopify
  def self.User
    self.POSSIBLE_ROLES[0]
  end
  def self.Fachschaft
    self.POSSIBLE_ROLES[1]
  end
  def self.Manager
    self.POSSIBLE_ROLES[2]
  end
  def self.Admin
    self.POSSIBLE_ROLES[3]
  end

  #Our possible roles array
  def self.POSSIBLE_ROLES
    ["User", "Fachschaft","Manager","Admin"]
  end
  #Gets the name of the role. A bit of Java love :)
def toString
  self.name
end
end
