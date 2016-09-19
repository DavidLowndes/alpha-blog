require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create(username: "David", email: "david@example.com", password: "password")
  end

  test "sign up new user" do
    get signup_path
    assert_template 'users/new'
    assert_difference 'User.count', 1 do
      post users_path, user: {username: "john", email: "john@example.com", password: "password"}
      follow_redirect!
    end
    assert_template "users/show"
    assert_match "john", response.body
  end

  test "duplicate username results in failure" do
    get signup_path
    assert_template 'users/new'
    assert_no_difference 'User.count' do
      post users_path, user: {username: "David", email: "john@example.com", password: "password"}
    end
    assert_template "users/new"
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end

end