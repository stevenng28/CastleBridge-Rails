class StaticPagesController < ApplicationController
  include StaticPagesHelper
  
  def home
  end
  
  def sendclosed
    status_mail_to_list('closed')
    render html: "Sent closed"
  end
  
  def sendopen
    status_mail_to_list('open')
    render html: "Sent open"
  end
  
end
