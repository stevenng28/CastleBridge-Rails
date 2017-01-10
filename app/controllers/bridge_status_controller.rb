class BridgeStatusController < ApplicationController
  def edit
    render html: 'editing page'
  end
  
  def update
    render html: 'updating page'
  end
end
