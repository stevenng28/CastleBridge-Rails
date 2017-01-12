class TextMailer < ApplicationMailer
  default from: 'stevenng1294@gmail.com'
  
  def status_email(user, timestamp, status)
    @user = user
    @timestamp = timestamp
    @status = status
    mail to: @user.email, subject: 'CastleBridge Email'
  end
  
  #Handle emails to notify_to users
  def normal_email(user, status)
    @user = user
    @status = status
    mail to: @user.email, subject: 'CastleBridge Normal Email'
  end
  
  #Handle emails to morning_notify users
  def morning_email(user, status)
    @user = user
    @status = status
    mail to: @user.email, subject: 'CastleBridge Morning Email'
  end
  
  #Handle warning emails to all users
  def warning_email(user, warning)
    @user = user
    @warning = warning
    mail to: @user.email, subject: 'CastleBridge Warning Email'
  end
  
  #Handle sending resolved emails to all users
  def resolved_email(user, warning)
    @user = user
    @warning = warning
    mail to: @user.email, subject: 'CastleBridge Resolved Email'
  end
  
end
