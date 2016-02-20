#Is an event repeated? If so how often?
class Recurrence < ActiveRecord::Base
  include IceCube
  has_one :event
  has_many :rules

end
