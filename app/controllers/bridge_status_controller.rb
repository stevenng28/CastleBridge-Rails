class BridgeStatusController < ApplicationController
  include BridgeStatusHelper
  skip_before_action :verify_authenticity_token
  
  def edit
    render html: 'editing page'
  end
  
  def update
    @bridge_status = BridgeStatus.first
    puts request.env
    update_symbol = status_params.key('true')
    if update_symbol
      handle_mail(update_symbol)
      if @bridge_status.update_attribute(update_symbol, Time.now)
        render html: 'Update success'
      else
        render html: 'Update failed'
      end
    else
      render html: 'No update made'
    end
  end
  
  private
  
    def status_params
      params.require(:status).permit(:closed, :open, :closing, :opening)
    end
end
