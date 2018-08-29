require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest
  include ApplicationHelper

  def setup
    @user = users(:michael)
    @other_user = users(:archer)
  end

  test "profile display" do
    get user_path(@user)
    assert_template 'users/show'
    assert_select 'title', full_title(@user.name)
    assert_select 'h1', text: @user.name
    assert_select 'h1>img.gravatar'
    assert_match @user.microposts.count.to_s, response.body
    assert_select 'div.pagination', count: 1
    @user.microposts.paginate(page: 1).each do |micropost|
      assert_match micropost.content, response.body
    end
    # stat
    assert_select 'strong[id=following]', text: "#{@user.following.count}"
    assert_select 'strong[id=followers]', text: "#{@user.followers.count}"
    # follow unfollow
    #log_in_as(@user)
    #get user_path(@user)
    #assert_template 'users/show'
    #assert_select 'div[id=follow_form]', count: 0
    #get user_path(@other_user)
    #assert_select 'input[value=?]', 'Follow'
    #@user.follow(@other_user)

  end
end