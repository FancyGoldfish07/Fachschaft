#Represents a date where the event is not held
class Exclude < ActiveRecord::Base
  has_one :recurrence
end
