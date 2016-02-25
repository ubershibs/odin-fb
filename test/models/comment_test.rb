require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  def setup
    @post = posts(:tau_manifesto)
    @comment = comments(:one)
  end

  test "comment should be valid" do 
    assert @comment.valid?
  end

  test "content should not be blank" do
    @comment.content = "  "
    assert_not @comment.valid?
  end

  test "user_id should not be blank" do
    @comment.user_id = "  "
    assert_not @comment.valid?
  end

  test "post_id should not be blank" do 
    @comment.post_id =  " "
    assert_not @comment.valid?
  end

  test "post should exist" do
    assert @comment.post.id == @post.id
  end
end
