#Represents a date where the event is not held
class Exclude < ActiveRecord::Base
  belongs_to :recurrence
end
