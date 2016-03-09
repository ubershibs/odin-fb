class RenameTable < ActiveRecord::Migration
  def change
    drop_table :posts
    rename_table :text_posts, :posts
  end
end
