class Newsletter < ActiveRecord::Base
  belongs_to :admin, class_name: 'User',
             foreign_key: 'admin_id'
  belongs_to :manager, class_name: 'User',
             foreign_key: 'manager_id'
  after_save :send_newsletter
  after_initialize :set_defaults
  after_save :check_reviewed

  enum state: {unsubmitted:0, waiting:1, published:2}

  def send_newsletter
    # Event has to be newer than "from"

    @from = Newsletter.from.strftime('%y%m%d')
    # Event has to be older than "to"
    @to = Newsletter.to.strftime('%y%m%d')

    # Array for selected events
    @newsletter_events = Array.new

    # Select all events

    @events = Event.where(flag: true, published: true)

    # Loop puts desired events into array
    @events.each do |u|
      @date = u.start

      # Event needs to be flagged and takes place in desired period

      if u.start.strftime('%y%m%d')>=@from and u.start.strftime('%y%m%d')<=@to

        # Adds event to array
        @newsletter_events.push(u)

      end
    end

    @subscribers = Subscriber.all

    @subscribers.each do|u|
      # Sends newsletter to subscribers
      NewsletterMailer.send_newsletter(u, @newsletter_events, Newsletter.subject, Newsletter.description).deliver_later
    end
  end
end
