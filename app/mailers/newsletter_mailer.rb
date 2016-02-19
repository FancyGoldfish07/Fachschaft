class NewsletterMailer < ApplicationMailer

  def send_newsletter
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
