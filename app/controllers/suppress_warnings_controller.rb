class SuppressWarningsController < ApplicationController
  
  def edit
    warning = Warning.find_by(id: params[:id])
    user = User.find_by(toggle_token: params[:user_token])
    warning.update_attributes(suppressed: true, suppressed_by_id: user.id)
    #send resolve email
    render html: "Warning suppressed"
  end
end
