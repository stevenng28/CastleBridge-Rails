class TextMailer < ApplicationMailer
  
  default from: 'stevenng1294@gmail.com'
  
  def status_email(user)
    @user = user
    mail(to: @user.email, subject: 'Test Text')
  end
end
