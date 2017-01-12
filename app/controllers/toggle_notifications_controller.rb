class ToggleNotificationsController < ApplicationController
  
  def edit
    user = User.find_by(email: params[:email])
    user.update_attribute(:notify_to, !user.notify_to?) if user
    if user.notify_to?
     render html: "Notifications toggled on"
    else
     render html: "Notifications toggled off"
    end
  end
end
