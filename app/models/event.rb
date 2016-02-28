#Event class for Calendar entries
class Event < ActiveRecord::Base
  has_many :event_roles, autosave: true
  belongs_to :event_category
  belongs_to :parent, class_name: 'Event'
  has_many :revisions, :class_name => 'Event', :foreign_key => 'parent_id'
  belongs_to :recurrence, autosave: true
  belongs_to :author, class_name: 'User',
             foreign_key: 'user_id'
  belongs_to :admin, class_name: 'User',
             foreign_key: 'admin_id'
  belongs_to :manager, class_name: 'User',
             foreign_key: 'manager_id'
  belongs_to :unadmin, class_name: "User",
             foreign_key: 'unadmin_id'
  belongs_to :unmanager, class_name: "User",
             foreign_key: 'unmanager_id'
  #The state this version is in
  enum state: {unsubmitted: 0, waiting: 1, reviewed: 2, rejected: 3, submitted: 4, deleted: 5}

  has_many :roles, through: :event_roles
  after_initialize :set_defaults


  #The priority
  enum priority: [:highest, :high, :medium, :low, :lowest]

  #Set backgroundColor based on priority. This is used in the JSON
  def backgroundColor
    if self.highest?
      "#ff884d"
    elsif self.high?
      "#ffcc80"
    else
      "#ffefcc"
    end
  end

  #Gives back all published instances of this model
  def self.giveBackAllPublished
    events = Event.submitted
    publishedEvents = Array.new
    events.each do |event|

      #This is defined in Event.state enum
      enumValue = 4
      kidsReadyToPublish = event.revisions.where("state = ?", enumValue)
      if kidsReadyToPublish.count > 0
        publishedEvents.push(kidsReadyToPublish.last)
      else
        if !event.parent.present?
          publishedEvents.push(event)
        end
      end
    end
    return publishedEvents
  end

  #Are we in a recurrence, but not the owner?
  def recurring_but_no_owner
    self.recurrence.present? && self.recurrence.owner != self
  end

  #Are we the owner of the recurrence
  def owner_of_recurrence
    self.recurrence.present? && self.recurrence.owner == self
  end

  #Is this event recurring?
  def recurring
    self.recurrence.present?
  end

  #Gets all days of this event from a specific point in time
  def getDatesFrom(date)
    if recurring
      events = recurrence.getDatesFrom(date).sort_by &:start
      events = Event.submitted
      publishedEvents = Array.new
      events.each do |event|

        #This is defined in Event.state enum
        enumValue = 4
        kidsReadyToPublish = event.revisions.where("state = ?", enumValue)
        if kidsReadyToPublish.count > 0
          if (kidsReadyToPublish.last.recurring)
            publishedEvents.push(kidsReadyToPublish.last)
          end
        else
          if !event.parent.present?
            publishedEvents.push(event)
          end
        end
      end
      return publishedEvents
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
                newStart= newStart.to_time.change(day: date.to_time.day, year: date.to_time.year, month: date.to_time.month)
                newEnd = self.end
                newEnd = newEnd.to_time.change(day: date.to_time.day, year: date.to_time.year, month: date.to_time.month)
                newStart = DateTime.parse(newStart.to_s)
                newEnd = DateTime.parse(newEnd.to_s)

                recurrence.events.create(title: self.title, description: self.description,
                                         event_category: self.event_category, ort: self.ort, role_ids: self.role_ids, url: self.url,
                                         imageURL: self.imageURL, start: newStart, end: newEnd, repeats: false,
                                         priority: self.priority, flag: self.flag, author: self.author, manager: self.manager, admin: self.admin, state: self.state, recurrence: self.recurrence)
              end
            end
          end
        end
      end
    end
  end

  #Publish this event
  def publish
    if repeats
      if self.parent.present?
        #We are not alone.
        if self.parent.revisions.count > 1
          #We are not the first revision
          #Get revisions that are published
          kidsReadyToPublish = self.parent.revisions.where("state = ?", 4)
          if kidsReadyToPublish.count > 1
            lastPublished = kidsReadyToPublish[kidsReadyToPublish.count - 2]
            #Last published unpublish your recurrence
            lastPublished.recurrence.unpublish
          else
            #None of the revisions was ready to publish
            #Destroy our parent's recurrence
            self.parent.recurrence.unpublish
          end
        else
          #We are the first revision
          #Unpublish our parents recurrence
          self.parent.recurrence.unpublish
        end


      end
      makeRecurr
    end
  end

  #Unpublishes revisions + their parent (except the parent that has no parent)
  def unpublish_revisions
    #Unpublish us
    if self.submitted?
      self.deleted!
      save
    end
    if self.revisions.present?
      #Unpublish the revisions
      self.revisions.each do |event|
        if event.submitted?
          event.deleted!
          event.save
        end
      end
    end
  end

  def unpublish_all
    if parent.blank?
      self.unpublish
    else
      self.parent.unpublish
    end
  end

  #Unpublishes an item and its revisions
  def unpublish
    if !recurring
      unpublish_self
    end
    if owner_of_recurrence
      recurrence.unpublish_complete
    end
    if recurring_but_no_owner
      #Create an exclude for our recurrence
      Exclude.create(date: self.start, recurrence: recurrence.owner.recurrence)
      #We're no longer part of that recurrence
      self.recurrence = nil
      #unpublish us
      unpublish_self

    end

  end

  #Unpublish all currently published revisions and the event itself
  def unpublish_self
    if self.submitted?
      self.deleted!
      save
    end
    if self.revisions.present?
      self.revisions.each do |event|
        if event.submitted?
          event.deleted!
          event.save
        end
      end
    end
  end

  #Unpublishes an event and all of its revisions and its recurrences
  def unpublish_recurrence
    self.deleted!

    save
    #Are we recurring?
    if recurring
      recurrence.owner.recurrence.events.each do |event|
        event.unpublish
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
      elsif user.current_role == Role.Admin
        if self.reviewed?
          self.admin = user
          self.submitted!
          self.publish
        end
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
    if self.repeats.blank?
      self.repeats = false
    end
  end
end

