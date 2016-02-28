class NotificationMailer < ApplicationMailer

  def notify_new_event(user, event)
    @user = user
    @event = event
    mail(to: user.email) do |format|
      format.html { render layout: '../../views/notification_mailer/notify_new_event.html.erb' }
      format.text { render text: '../../views/notification_mailer/notify_new_event.text.erb' }
    end
  end

  def notify_edited_event(user)
    @user = user
    mail(to: user.email) do |format|
      format.html { render layout: '../../views/notification_mailer/notify_edited_event.html.erb' }
      format.text { render text: '../../views/notification_mailer/notify_edited_event.text.erb' }
    end
  end

  def notify_approved_event(user)
    @user = user
    mail(to: user.email) do |format|
      format.html { render layout: '../../views/notification_mailer/notify_approved_event.html.erb' }
      format.text { render text: '../../views/notification_mailer/notify_approved_event.text.erb' }
    end
  end

  def request_deletion(user)
    @user = user
    mail(to: user.email) do |format|
      format.html { render layout: '../../views/notification_mailer/request_deletion.html.erb' }
      format.text { render text: '../../views/notification_mailer/request_deletion.text.erb' }
    end
  end
end
