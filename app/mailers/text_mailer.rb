class TextMailer < ApplicationMailer
  
  default from: 'example@notifications.com'
  
  def status_email(user)
    @user = user
    mail(to: @user.email, subject: 'Test Text')
  end
end
