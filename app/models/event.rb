#Event class for Calendar entries
class Event < ActiveRecord::Base
  has_and_belongs_to_many :roles
  belongs_to :event_category
  belongs_to :recurrence
  after_initialize :set_defaults
  after_save :check_reviewed
  #Uses paper trail
  has_paper_trail
  #The priority
  enum priority: [:highest, :high, :medium, :low, :lowest]

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
  #Done after save
  def check_reviewed
    if reviewed
      makeRevision
    end
  end
  #Makes a new revision for this thing.
  def makeRevision
   #Only temporarly
    if repeats
     makeRecurr
   end

  end
#Propagates the event into the future
  def makeRecurr
    if repeats
      if recurrence.present?
        if recurrence.events.count == 1
          #We are the only event yet, HOOORAY
          dates = recurrence.getDatesAllInOne
          dates.each do |date|
            date = DateTime.parse(date.to_time.to_s)
            date = date.to_date
            if date != start.to_date

              #We do not want to override ourselve
if !date.past?
  #We do not want to add past events
  time = start.to_time
  newStart = start
newStart=  newStart.to_time.change(day: date.to_time.day,year: date.to_time.year,month: date.to_time.month)
  newEnd = self.end
  newEnd = newEnd.to_time.change(day: date.to_time.day,year: date.to_time.year,month: date.to_time.month)
newStart = DateTime.parse(newStart.to_s)
  newEnd = DateTime.parse(newEnd.to_s)

  recurrence.events.create(title: self.title,description:self.description,
                           event_category: self.event_category, ort:self.ort,role_ids: self.role_ids,url: self.url,
                           imageURL: self.imageURL,start:newStart, end:newEnd,repeats: true,
                           priority: self.priority,flag:self.flag )
end
            end
          end
        end
      end
    end
  end
    private
    #Sets the default priority of the event and start dates
    def set_defaults
      if self.priority.blank?
      self.priority ||= :medium
      end
      if self.start.blank?
        self.start = Time.now + 1.day
      end
      if self.end.blank?
        self.end = start.to_time + 1.hour
      end
    end
  end
