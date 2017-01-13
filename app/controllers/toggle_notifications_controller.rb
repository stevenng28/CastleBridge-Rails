class ToggleNotificationsController < ApplicationController
  
  def edit
    user = User.find_by(id: params[:user_id])
    if user.toggle_token == params[:id]
      user.update_attribute(:notify_to, !user.notify_to?)
    end
    if user.notify_to?
     render html: "Notifications toggled on"
    else
     render html: "Notifications toggled off"
    end
  end
end
