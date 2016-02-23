require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new(email: "default@example.com", password: "password123",
                     password_confirmation: "password123")
  end

  test "user should be valid" do
    assert @user.valid?
  end

  test "email should be present" do 
    @user.email = "          "
    assert_not @user.valid?
  end

  test "email should have valid formatting" do
    @user.email = "luke@luke"
    assert_not @user.valid?
  end

  test "password and confirmation should match" do
    @user.password = "password123"
    @user.password_confirmation = "password456"
    assert_not @user.valid?
  end

  test "password and confirmation should be present" do
    @user.password = "   "
    @user.password_confirmation = "  "
    assert_not @user.valid?
  end
end
