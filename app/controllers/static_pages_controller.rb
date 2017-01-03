class StaticPagesController < ApplicationController
  def home
  end

  def notify
    @user = User.first
    TextMailer.status_email(@user).deliver_now
  end
end
