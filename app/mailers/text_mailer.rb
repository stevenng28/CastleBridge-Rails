class TextMailer < ApplicationMailer
  default from: 'stevenng1294@gmail.com'
  
  def status_email(user, timestamp, status)
    @user = user
    @timestamp = timestamp
    @status = status
    mail to: @user.email, subject: 'CastleBridge Email'
  end
  
  #Handle emails to notify_to users
  def normal_email(status)
    puts 'Send to notify'
    @status = status
    @users = User.where(notify_to: true)
    @users.each do |user|
      @user = user
      mail to: @user.email, subject: 'CastleBridge Normal Email'
    end
  end
  
  #Handle emails to morning_notify users
  def morning_email(status)
    puts 'Send to morning'
    @status = status
    @users = User.where(morning_notify: true)
    @users.each do |user|
      @user = user
      mail to: @user.email, subject: 'CastleBridge Morning Email'
    end
  end
  
  #Handle warning emails to all users
  def warning_email(warning)
    @warning = warning
    @users = User.all
    @users.each do |user|
      @user = user
      mail to: @user.email, subject: 'CastleBridge Warning Email'
    end
  end
  
  #Handle sending resolved emails to all users
  def resolved_email(warning, user)
    @warning = warning
    @resolved_by = user.name
    @users = User.all
    @users.each do |user|
      @user = user
      mail to: @user.email, subject: 'CastleBridge Resolved Email'
    end
  end
  
end
