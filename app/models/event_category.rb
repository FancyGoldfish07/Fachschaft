#Something to categorize an event, e.g. party
class EventCategory < ActiveRecord::Base
  has_many :events
end
