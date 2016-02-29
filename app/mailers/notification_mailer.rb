class NotificationMailer < ApplicationMailer

  def notify_new_event(user, event)
    @user = user
    @event = event
    mail(to: user.email, subject: "Ein neuer Eintrag muss genehmigt werden") do |format|
      format.html { render layout: '../../views/notification_mailer/notify_new_event.html.erb' }
      format.text { render text: '../../views/notification_mailer/notify_new_event.text.erb' }
    end
  end

  def notify_edited_event(user, event)
    @user = user
    @event = event
    mail(to: user.email, subject: "Ein Eintrag wurde bearbeitet") do |format|
      format.html { render layout: '../../views/notification_mailer/notify_edited_event.html.erb' }
      format.text { render text: '../../views/notification_mailer/notify_edited_event.text.erb' }
    end
  end

  def notify_approved_event(user, event)
    @user = user
    @event = event
    mail(to: user.email, subject: "Ein Eintrag wurde genehmigt") do |format|
      format.html { render layout: '../../views/notification_mailer/notify_approved_event.html.erb' }
      format.text { render text: '../../views/notification_mailer/notify_approved_event.text.erb' }
    end
  end

  def request_deletion(user, event)
    @event = event
    @user = user
    mail(to: user.email, subject: "Löschantrag") do |format|
      format.html { render layout: '../../views/notification_mailer/request_deletion.html.erb' }
      format.text { render text: '../../views/notification_mailer/request_deletion.text.erb' }
    end
  end

  def notify_disapproved(user, msg)
    @user = user
    @msg = msg
    mail(to: user.email, subject: "Ihr Eintrag wurde abgelehnt") do |format|
      format.html { render layout: '../../views/notification_mailer/notify_disapproved.html.erb' }
      format.text { render text: '../../views/notification_mailer/notify_disapproved.text.erb' }
    end
  end
end
