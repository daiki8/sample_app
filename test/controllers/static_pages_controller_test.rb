require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @default_title = 'Ruby on Rails Tutorial Sample App'
  end
  test "should get home" do
    get static_pages_home_url
    assert_response :success
    assert_select "title", "Home | #{@default_title}"
  end

  test "should get help" do
    get static_pages_help_url
    assert_response :success
    assert_select "title", "Help | #{@default_title}"
  end
  test "should get about" do
    get static_pages_about_url
    assert_response :success
    assert_select "title", "About | #{@default_title}"
  end

end
