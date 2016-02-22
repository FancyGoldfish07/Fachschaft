#Event class for Calendar entries
class Event < ActiveRecord::Base
  has_and_belongs_to_many :roles
  belongs_to :event_category
  belongs_to :recurrence
  after_initialize :set_defaults, :if => :new_record?
  #The priority
  enum priority: [:highest, :high, :medium, :low, :lowest]
#The duration of the event in seconds
  def duration
  return ((self.end - self.start)* 24 * 60 * 60)
end
  #Set backgroundColor based on priority. This is used in the JSON
  def backgroundColor
    if self.highest?
      "red"
    elsif self.high?
      "blue"
    else
      "white"
    end
    end
    private
    #Sets the default priority of the event and start dates
    def set_defaults
      if self.priority.blank?
      self.priority ||= :medium
      end
      if self.start.blank?
        start = DateTime.now
      end
      if self.end.blank?
        self.end = start + 1.hour
      end
    end
  end
