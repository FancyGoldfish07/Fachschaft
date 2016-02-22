class NewsletterMailer < ApplicationMailer

  def send_newsletter(subscriber, newsletter_events)
    @subscriber = subscriber
    @newsletter_events = newsletter_events
    mail(to: subscriber.email, subject: "Weekly newsletter") do |format|
      format.html { render layout: '../../views/newsletter_mailer/send_newsletter.html.erb' }
      format.text { render text: '../../views/newsletter_mailer/send_newsletter.text.erb' }
    end
  end

  def newsletter_signup_confirmation(subscriber)
    @subscriber = subscriber
    mail(to: subscriber.email, subject: "Newsletter signup confirmation") do |format|
      format.html { render layout: '../../views/newsletter_mailer/newsletter_signup_confirmation.html.erb' }
      format.text { render text: '../../views/newsletter_mailer/newsletter_signup_confirmation.text.erb' }
    end
  end

  def delete_subscription_conf(subscriber)
    @subscriber = subscriber
    mail(to: subscriber.email, subject: "Subscription has been canceld") do |format|
      format.html { render layout: '../../views/newsletter_mailer/delete_subscription_conf.html.erb' }
      format.text { render text: '../../views/newsletter_mailer/delete_subscription_conf.text.erb' }
    end
  end



end
