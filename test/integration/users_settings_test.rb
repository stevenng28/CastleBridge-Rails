require 'test_helper'

class UsersSettingsTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:bar)
  end
  
  test "toggle normal notifications" do
    get edit_toggle_notification_path(id: @user.toggle_token, user_id: @user.id)
    @user.reload
    assert @user.notify_to?
    get edit_toggle_notification_path(id: @user.toggle_token, user_id: @user.id)
    @user.reload
    assert_not @user.notify_to?
  end
  
  test "toggle morning notifications" do
    get edit_toggle_morning_notification_path(id: @user.toggle_token, 
                                              user_id: @user.id)
    @user.reload
    assert @user.morning_notify?
    get edit_toggle_morning_notification_path(id: @user.toggle_token, 
                                              user_id: @user.id)
    @user.reload
    assert_not @user.morning_notify?
  end
  
end
