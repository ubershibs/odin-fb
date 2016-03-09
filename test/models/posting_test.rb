require "test_helper"

class PostingTest < ActiveSupport::TestCase
  def posting
    @posting ||= Posting.new
  end

  def test_valid
    assert posting.valid?
  end
end
