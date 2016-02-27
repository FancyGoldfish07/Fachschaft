class Newsletter < ActiveRecord::Base

  after_save :send_newsletter
  after_initialize :set_defaults
  after_save :check_reviewed

  enum state: {unsubmitted:0, waiting:1, published:2}

  def send_newsletter(from, to, subject, text)
    # Event has to be newer than "from"
    @from = from.strftime('%y%m%d')

    # Event has to be older than "to"
    @to = to.strftime('%y%m%d')

    # Array for selected events
    @newsletter_events = Array.new

    # Select all events
    @events = Event.where(flag: true, reviewed: true)

    # Loop puts desired events into array
    @events.each do |u|
      @date = u.start

      # Event needs to be flagged and takes place in desired period
      if u.published == true and u.start.strftime('%y%m%d')>=@from and u.start.strftime('%y%m%d')<=@to

        # Adds event to array
        @newsletter_events.push(u)

      end
    end

    @subscribers = Subscriber.all
    @subscribers.each do |u|

      # Sends newsletter zo subscribers
      NewsletterMailer.send_newsletter(u, @newsletter_events, subject, text).deliver_later
    end




  def check_submitted
    if submitted
      makeRevision
    end
  end



  #Changes the state of the version based on the user
  def changeState(user)
    if user.current_role == Role.Admin
      if self.unsubmitted?
        #Set the author of this event revision
        self.admin = user
        #Make sure the event is awaiting approval
        self.waiting!
      elsif user.current_role == Role.Admin
        if self.reviewed?
          self.manager = user
          self.submitted!
          self.send_newsletter
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
    if self.from.blank?
      self.from = Time.now
    end
    if self.end.blank?
      self.to = from.to_time + 1.week
    end
  end
end
