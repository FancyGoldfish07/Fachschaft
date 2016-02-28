#Represents a date where the event is not held
class Exclude < ActiveRecord::Base
include ModelHelpers
  belongs_to :recurrence
#For checking if a date was already selected, hopefully...
def to_s
 pretty_date date
end

end
