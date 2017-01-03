# Preview all emails at http://rails-tutorial-sng28.c9users.io:8080/rails/mailers/text_mailer
class TextMailerPreview < ActionMailer::Preview
  
  def status_email
    @user = User.first
    TextMailer.status_email(@user)
  end

end
