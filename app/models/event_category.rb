#Something to categorize an event, e.g. party
class EventCategory < ActiveRecord::Base
  has_many :events
  has_many :occurrences
end
