require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  
  test "logged out visito ris redirected" do
    get root_path
    assert_redirected_to new_user_session_path
  end

  test "invalid user signup" do
    get new_user_registration_path
    assert_no_difference 'User.count' do
      post user_registration_path, user: { email: "user@invalid",
                                   password: "foo",
                                   password_confirmation: "bar" }
    end
  end

  test "valid user signup" do
    get new_user_registration_path
    assert_difference 'User.count', 1 do
      post user_registration_path, user: { email: "user@valid.com",
                                   password: "foo123456",
                                   password_confirmation: "foo123456" }
    end
    assert current_user == user
  end
end
