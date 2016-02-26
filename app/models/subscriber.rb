class Subscriber < ActiveRecord::Base

  after_save :send_signup_conf
  before_destroy :destroy_confirmation

  def send_signup_conf
    NewsletterMailer.newsletter_signup_confirmation(self).deliver_later
  end

  def destroy_confirmation
    NewsletterMailer.delete_subscription_conf(self).deliver
  end

end
