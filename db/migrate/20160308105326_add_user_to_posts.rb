class AddUserToPosts < ActiveRecord::Migration
  def change
    add_reference :text_posts, :user, index: true, foreign_key: true
  end
end
