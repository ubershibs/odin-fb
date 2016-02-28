require 'test_helper'

class LikeTest < ActiveSupport::TestCase
 
  def setup
    @like = Like.new(user_id: 1, likeable_type: "post", likeable_id: 1)
  end

  test "should be valid" do 
    assert @like.valid?
  end

  test "user_id should be present" do
    @like.user_id = nil
    assert_not @like.valid?
  end

  test "likeable_type should be present" do
    @like.likeable_type = "   "
    assert_not @like.valid?
  end

  test "likeable_id should be present" do
    @like.likeable_id = nil
    assert_not @like.valid?
    endw
end
