# Preview all emails at http://localhost:3000/rails/mailers/newsletter
class NewsletterMailerPreview < ActionMailer::Preview
  def newsletter_preview
    Newsletter.sample_email(User.first)
  end
end