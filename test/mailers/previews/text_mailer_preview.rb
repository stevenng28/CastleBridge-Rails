# Preview all emails at http://rails-tutorial-sng28.c9users.io:8080/rails/mailers/text_mailer
class TextMailerPreview < ActionMailer::Preview
  
  def normal_email_closed
    TextMailer.normal_email(User.first, 'closed')
  end
  
  def morning_email_closed
    TextMailer.morning_email(User.first, 'closed')
  end
  
  def warning_email
    TextMailer.warning_email(User.first, Warning.find_by(status: 'open'))
  end
  
  def resolved_email
    TextMailer.resolved_email(User.first, Warning.find_by(status: 'open'))
  end

end
