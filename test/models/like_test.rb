require 'test_helper'

class LikeTest < ActiveSupport::TestCase
 
  def setup
    @user = users(:luke)
    @post = posts(:orange)
    @like = @user.likes.create(likeable: @post )
  end

  test "should be valid" do 
    assert @like.valid?
  end

  test "user_id should be present" do
    assert @like.valid?
    user = nil
    post = posts(:orange)
    like = post.likes.build
    like.user = user
    assert_not like.valid?
  end

  test "likeable_type should be present" do
    @like.likeable_type = "   "
    assert_not @like.valid?
  end

  test "likeable_id should be present" do
    @like.likeable_id = nil
    assert_not @like.valid?
  end
end
