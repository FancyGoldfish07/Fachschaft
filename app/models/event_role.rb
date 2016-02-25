#Is a helper table to allow a has_many through association between the two
class EventRole < ActiveRecord::Base
  belongs_to :event
  belongs_to :role
  #Uses paper trail
  has_many :event_role_versions
end
