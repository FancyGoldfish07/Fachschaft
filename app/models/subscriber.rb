class Subscriber < ActiveRecord::Base
  def get_subscribers
    @subscribers = Subscriber.all
    @subscribers.each do|u|
      NewsletterMailer.send_newsletter(u).deliver
    end
  end
end
