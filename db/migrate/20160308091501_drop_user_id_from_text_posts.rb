class DropUserIdFromTextPosts < ActiveRecord::Migration
  def change
    remove_index  :text_posts, :user_id
    remove_column :text_posts, :user_id
  end
end
