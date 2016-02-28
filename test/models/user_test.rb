require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new(name: "the man", email: "the_man@the_man.com", password: "foobar123",
                     password_confirmation: "foobar123")
  end

  test "should be valid" do
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

  test "name should be present or nil" do
    @user.name = "Luke Walker"
    assert @user.valid?
    @user.name = nil
    assert @user.valid?
    @user.name = "  "
    assert_not @user.valid?
  end

  test "name should not be more than 50 char" do 
    @user.name = "a" * 51
    assert_not @user.valid?
  end

end


