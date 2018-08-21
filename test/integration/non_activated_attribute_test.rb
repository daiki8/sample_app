require 'test_helper'

class NonActivatedAttributeTest < ActionDispatch::IntegrationTest
  
  def setup
    @admin = users(:michael)
    @not_activated_attribute = users(:not_activated_attribute)
  end
  
  test "should not allow the not activated attribute" do
    assert_not @not_activated_attribute.activated?
    log_in_as(@admin)
    get users_path
    assert_template 'users/index'
    assert_select "a[href=?]", user_path(@not_activated_attribute), count: 0
    get user_path(@not_activated_attribute)
    assert_redirected_to root_path
  end
end
