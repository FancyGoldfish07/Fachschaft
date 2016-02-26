class Newsletter < ActiveRecord::Base

  after_save :send_newsletter

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
    @events.each do|u|
      @date = u.start
      # Event needs to be flagged and takes place in desired period
      if u.published == true and u.start.strftime('%y%m%d')>=@from and u.start.strftime('%y%m%d')<=@to
        # Adds event to array
        @newsletter_events.push(u)
      end
    end
    @subscribers = Subscriber.all
    @subscribers.each do|u|
      # Sends newsletter zo subscribers
      NewsletterMailer.send_newsletter(u, @newsletter_events, subject, text).deliver_later
    end
  end
end
