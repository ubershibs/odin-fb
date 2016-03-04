require 'test_helper'

class NoticeMailerTest < ActionMailer::TestCase
  test "welcome" do
    @user = users(:luke)
    email = NoticeMailer.welcome(@user).deliver_now
    assert_not ActionMailer::Base.deliveries.empty?
  end
end
