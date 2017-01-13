require 'test_helper'

class BridgeStatusUpdateTest < ActionDispatch::IntegrationTest
  
  def setup
    ActionMailer::Base.deliveries.clear
    @bridge_status = bridge_statuses(:open_long)
    @warning = warnings(:open)
  end
  
  test "door open too long (warning mail)" do
    put record_path, params: { status: { :open => 'true' } }
    assert_equal User.count, ActionMailer::Base.deliveries.size
  end
  
  test "door sequence: closed, opening, closed" do
    ActionMailer::Base.deliveries.clear
    put record_path, params: { status: { :closed => 'true' } }
    sleep 1
    put record_path, params: { status: { :opening => 'true' } }
    sleep 1
    put record_path, params: { status: { :closed => 'true' } }
    assert_equal User.where(notify_to: true).size, ActionMailer::Base.deliveries.size
  end
  
  test "door sequence: open, closing, closed" do
    ActionMailer::Base.deliveries.clear
    @bridge_status.update_attribute(:opening, Time.now)
    put record_path, params: { status: { :open => 'true' } }
    sleep 1
    put record_path, params: { status: { :closing => 'true' } }
    sleep 1
    put record_path, params: { status: { :closed => 'true' } }
    assert_equal User.where(notify_to: true).size, ActionMailer::Base.deliveries.size
  end
end
