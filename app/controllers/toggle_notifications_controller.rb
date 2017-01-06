class ToggleNotificationsController < ApplicationController
  
  def edit
    user = User.find_by(email: params[:email])
    user.update_attribute(:notify_to, !user.notify_to?) if user
    if user.notify_to?
     flash[:success] = "Notifications toggled on"
    else
     flash[:success] = "Notifications toggled off"
    end
    redirect_to root_url
  end
end
