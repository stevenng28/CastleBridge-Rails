module ApplicationHelper
  
  #Sends mail to all notify_to
  def sendNormal(status)
    users = User.where(notify_to: true)
    users.each do |user|
      TextMailer.normal_email(user, status).deliver_now
    end
  end
  
  #Sends mail to all morning_notify
  def sendMorning(status)
    users = User.where(morning_notify: true)
    users.each do |user|
      TextMailer.morning_email(user, status).deliver_now
    end
  end
  
  #Sends warning mail to all users
  def sendWarning(warning)
    users = User.all
    users.each do |user|
      TextMailer.warning_email(user, warning).deliver_now
    end
  end
  
  #Sends resolved mail to all users
  def sendResolved(warning)
    users = User.all
    users.each do |user|
      TextMailer.resolved_email(user, warning).deliver_now
    end
  end
end
