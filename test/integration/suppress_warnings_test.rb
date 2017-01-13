require 'test_helper'

class SuppressWarningsTest < ActionDispatch::IntegrationTest
  
  def setup
    ActionMailer::Base.deliveries.clear
    @user = users(:foo)
    @warning = warnings(:open)
  end
  
  test "suppress warning" do
    get edit_suppress_warning_path(id: @warning.id, 
                                   user_token: @user.toggle_token)
    @warning.reload
    assert @warning.suppressed?
    assert_equal @user.id, @warning.suppressed_by_id
    assert_equal User.count, ActionMailer::Base.deliveries.size
  end
end
