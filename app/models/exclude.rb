#Represents a date where the event is not held
class Exclude < ActiveRecord::Base
  has_many :exclude_versions
  belongs_to :recurrence
#For checking if a date was already selected, hopefully...
def to_s
  date.to_s
end

end
