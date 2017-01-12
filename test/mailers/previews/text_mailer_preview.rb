# Preview all emails at http://rails-tutorial-sng28.c9users.io:8080/rails/mailers/text_mailer
class TextMailerPreview < ActionMailer::Preview
  
  def closed_email
    formatted_timestamp = Time.now.getlocal('-08:00').strftime("%a %x %r")
    TextMailer.status_email(User.last, formatted_timestamp, 'closed')
  end
  
  def open_email
    formatted_timestamp = Time.now.getlocal('-08:00').strftime("%a %x %r")
    TextMailer.status_email(User.last, formatted_timestamp, 'open')
  end
  
  def normal_email_closed
    TextMailer.normal_email('closed')
  end
  
  def morning_email_closed
    TextMailer.morning_email('closed')
  end
  
  def warning_email
    TextMailer.warning_email(Warning.find_by(status: 'open'))
  end
  
  def resolved_email
    TextMailer.resolved_email(Warning.find_by(status: 'open'), User.first)
  end

end
