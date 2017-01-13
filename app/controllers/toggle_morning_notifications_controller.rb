class ToggleMorningNotificationsController < ApplicationController
  
  def edit
    user = User.find_by(id: params[:user_id])
    if user.toggle_token == params[:id]
      user.update_attribute(:morning_notify, !user.morning_notify?)
    end
    if user.morning_notify?
     render html: "Notifications toggled on"
    else
     render html: "Notifications toggled off"
    end
  end
end
