class Newsletter < ActiveRecord::Base
  belongs_to :admin, class_name: 'User',
             foreign_key: 'admin_id'
  belongs_to :manager, class_name: 'User',
             foreign_key: 'manager_id'

  validates_presence_of :subject, :description;
  validates_datetime :to, :after => :from

  enum state: {unsubmitted:0, waiting:1, published:2}

  def notify_admin
    @admins = Array.new
    @users = User.all
    @users.each do |u|
      if u.isAdmin
        # Adds admin to array
        @admins.push(u)
      end
    end
    @admins.each do |f|
      NewsletterMailer.notify_approved_newsletter(f).deliver_later
    end
  end

  def notify_manager(x)
    @managers = Array.new
    @users = User.all
    @users.each do |u|
      if u.isManager
        # Adds manager to array
        @managers.push(u)
      end
    end
    @managers.each do |f|
      puts case x
             when 0
               NewsletterMailer.notify_new_newsletter(f).deliver_later
             when 1
               NewsletterMailer.notify_deleted_newsletter(f).deliver_later
           end
    end
  end

  def send_newsletter
    # Event has to be newer than "from"
    @from = self.from.strftime('%y%m%d')
    # Event has to be older than "to"
    @to = self.to.strftime('%y%m%d')

    # Array for selected events
    @newsletter_events = Array.new

    # Select all events

    @events = Event.where("flag is true and admin_id is not null")

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
      NewsletterMailer.send_newsletter(u, @newsletter_events, self.subject, self.description).deliver_later
    end
  end
end
