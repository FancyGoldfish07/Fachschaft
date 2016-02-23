class Newsletter < ActionMailer::Base
  default from: "jannikwortmann92@gmail.com"

  def sample_email_test(user)
    time1 = Time.new
    @user = user
    mail(to: @user.email, subject: puts 'Newsletter Test '+time1.month + time1.year)
  end
  def sample_email(user)
    time1 = Time.new
    @user = user
    mg_client = Mailgun::Client.new 'key-cb78195c9fe570d7aede6c2a50fb2763'
    message_params = {:from    => 'jannikwortmann92@gmail.com',
                      :to      => 'jannikwortmann92@gmail.com',
                      :subject => 'Sample Mail using Mailgun API',
                      :text    => 'This mail is sent using Mailgun API via mailgun-ruby'}
    mg_client.send_message 'sandbox4ea8eba4cefb460db058755433978bcd.mailgun.org', message_params
  end

end
