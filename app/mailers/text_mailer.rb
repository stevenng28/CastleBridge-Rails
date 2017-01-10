class TextMailer < ApplicationMailer
  default from: 'stevenng1294@gmail.com'
  
  def status_email(user, timestamp, status)
    @user = user
    @timestamp = timestamp
    @status = status
    mail to: @user.email, subject: 'CastleBridge Email'
  end
end
