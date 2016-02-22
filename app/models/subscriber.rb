class Subscriber < ActiveRecord::Base
  def send_newsletter
    @newsletter_events = Array.new
    @events = Event.all
    @events.each do|u|
      if u.flag?
        @newsletter_events.push(u)
      end
    end
    @subscribers = Subscriber.all
    @subscribers.each do|u|
      NewsletterMailer.send_newsletter(u, @newsletter_events).deliver_later
    end
  end
end
