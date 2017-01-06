class StaticPagesController < ApplicationController
  def home
  end
  
  def sendclosed
    formatted_timestamp = Time.now.getlocal('-08:00').strftime("%a %x %r")
    users = User.where(notify_to: true)
    users.each do |user|
      TextMailer.status_email(user, formatted_timestamp, 'closed').deliver_now
    end
    render html: "Sent closed"
  end
  
  def sendopen
    formatted_timestamp = Time.now.getlocal('-08:00').strftime("%a %x %r")
    users = User.where(notify_to: true)
    users.each do |user|
      TextMailer.status_email(user, formatted_timestamp, 'open').deliver_now
    end
    render html: "Sent open"
  end
  
end
