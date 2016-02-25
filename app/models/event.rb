#Event class for Calendar entries
class Event < ActiveRecord::Base
  has_many :event_roles, autosave: true
  belongs_to :event_category
  belongs_to :parent, class_name: 'Event'
  has_many :revision, :class_name => 'Event', :foreign_key => 'parent_id'
  belongs_to :recurrence, autosave: true
  belongs_to :author, class_name: 'User',
             foreign_key: 'user_id'
  belongs_to :admin,  class_name: 'User',
             foreign_key: 'admin_id'
  belongs_to :manager, class_name: 'User',
             foreign_key: 'manager_id'
  #The state this version is in
  enum state: [:unsubmitted, :waiting, :reviewed, :rejected, :submitted]

  has_many :roles, through: :event_roles
  after_initialize :set_defaults
  after_save :check_reviewed

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
  #Changes the state of the version based on the user
  def changeState(user)
    if user.current_role == Role.Fachschaft || user.current_role == Role.Admin
      if self.unsubmitted?
        #Set the author of this event revision
        self.author = user
        #Make sure the event is awaiting approval
        self.waiting!
      end
    end
    save
  end
    private
    #Sets the default priority of the event and start dates
    def set_defaults
      if self.state.blank?
        self.state ||= :unsubmitted
      end
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
