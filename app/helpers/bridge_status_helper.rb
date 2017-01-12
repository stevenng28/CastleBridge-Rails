module BridgeStatusHelper
  
  #Uses previous statuses to determine whether to send mail
  def handle_mail(update_key)
    recent_status = most_recent_statuses()
    case update_key
    when 'closed'
      @warning = Warning.find_by(status: 'open') #Unsuppress open warning
      @warning.update_attributes(suppressed: false, 
                                 suppressed_by_id: nil,
                                 minutes_open: 0)
      if (recent_status[0][0] == 'opening' && recent_status[1][0] == 'closed')
        TextMailer.morning_email(update_key).deliver_now if is_weekday_morning?
        TextMailer.normal_email(update_key).deliver_now  if !is_weekday_morning?
      elsif (recent_status[0][0] == 'closing' && recent_status[1][0] == 'open')
        TextMailer.morning_email(update_key).deliver_now if is_weekday_morning?
        TextMailer.normal_email(update_key).deliver_now  if !is_weekday_morning?
      end
    when 'open'
      if (recent_status[0][0] == 'open')
        time_open = Time.now - recent_status[0][1]
        if(time_open > 1800)
          warning = Warning.find_by(status: 'open')
          warning.update_attribute(:minutes_open, warning.minutes_open + 30)
          TextMailer.warning_email(warning).deliver_now if !warning.suppressed?
        end
      end
    else
      puts 'Warning: recent statuses were unusual. 
            An earlier update may have failed!'
    end
  end
  
  private
  
    #Returns a status array sorted in descending order
    def most_recent_statuses()
      @bridge_status.reload
      bridge_att = @bridge_status.attributes
      bridge_att.delete("id")
      bridge_att.delete("created_at")
      bridge_att.delete("updated_at")
      bridge_att = bridge_att.sort_by{ |k, v| v }.reverse
      return bridge_att
    end
    
    #Returns if Mon-Fri 7-8AM PST
    def is_weekday_morning?
      time = Time.now.getlocal('-08:00')
      return time.hour == 7 && !time.saturday? && !time.sunday?
    end
end
