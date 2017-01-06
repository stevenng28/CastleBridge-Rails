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

end
