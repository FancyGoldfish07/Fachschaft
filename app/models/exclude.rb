#Represents a date where the event is not held
class Exclude < ActiveRecord::Base
  #Uses paper trail
  has_paper_trail
  belongs_to :recurrence
#For checking if a date was already selected, hopefully...
def to_s
  date.to_s
end

end
