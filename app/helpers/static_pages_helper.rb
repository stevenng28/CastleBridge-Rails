module StaticPagesHelper
  
  # Formats settings and sends mail to listed users
  def status_mail_to_list(status)
    formatted_timestamp = Time.now.getlocal('-08:00').strftime("%a %x %r")
    users = User.where(notify_to: true)
    users.each do |user|
      TextMailer.status_email(user, formatted_timestamp, status).deliver_now
    end
  end
end
