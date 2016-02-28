class NewsletterMailer < ApplicationMailer

  def send_newsletter(subscriber, newsletter_events, subject,text)
    @subject = subject
    @text = text
    @subscriber = subscriber
    @newsletter_events = newsletter_events
    mail(to: subscriber.email, subject: @subject) do |format|
      format.html { render layout: '../../views/newsletter_mailer/send_newsletter.html.erb' }
      format.text { render text: '../../views/newsletter_mailer/send_newsletter.text.erb' }
    end
  end

  def notify_new_newsletter(user)
    @user = user

    mail(to: user.email, subject: "Ein neuer Newsletter wurde erstellt") do |format|
      format.html { render layout: '../../views/newsletter_mailer/notify_new_newsletter.html.erb' }
      format.text { render text: '../../views/newsletter_mailer/notify_new_newsletter.text.erb' }
    end
  end

  def notify_approved_newsletter(user)
    @user = user

    mail(to: user.email, subject: "Newsletter wurde genehmigt") do |format|
      format.html { render layout: '../../views/newsletter_mailer/notify_approved_newsletter.html.erb' }
      format.text { render text: '../../views/newsletter_mailer/notify_approved_newsletter.text.erb' }
    end
  end

  def notify_deleted_newsletter(user)
    @user = user

    mail(to: user.email, subject: "Newsletter gelöscht") do |format|
      format.html { render layout: '../../views/newsletter_mailer/notify_deleted_newsletter.html.erb' }
      format.text { render text: '../../views/newsletter_mailer/notify_deleted_newsletter.text.erb' }
    end
  end

  def newsletter_signup_confirmation(subscriber)
    @subscriber = subscriber
    mail(to: subscriber.email, subject: "Newsletter Anmeldung") do |format|
      format.html { render layout: '../../views/newsletter_mailer/newsletter_signup_confirmation.html.erb' }
      format.text { render text: '../../views/newsletter_mailer/newsletter_signup_confirmation.text.erb' }
    end
  end

  def delete_subscription_conf(subscriber)
    @subscriber = subscriber
    mail(to: subscriber.email, subject: "Newsletter Abo beendet") do |format|
      format.html { render layout: '../../views/newsletter_mailer/delete_subscription_conf.html.erb' }
      format.text { render text: '../../views/newsletter_mailer/delete_subscription_conf.text.erb' }
    end
  end



end
