require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup infomation" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name: "",
                                        email: "user@invalid",
                                        password: "foo",
                                        password_confirmation: "bar" } }
    end
    assert_template 'users/new'
    assert_select 'div.alert, div.alert-danger', "The form contains 4 errors."
  end
end
