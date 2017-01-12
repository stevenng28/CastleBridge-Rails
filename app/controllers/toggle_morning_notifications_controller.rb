class ToggleMorningNotificationsController < ApplicationController
  
  def edit
    user = User.find_by(email: params[:email])
    user.update_attribute(:morning_notify, !user.morning_notify?) if user
    if user.morning_notify?
     render html: "Notifications toggled on"
    else
     render html: "Notifications toggled off"
    end
  end
end
