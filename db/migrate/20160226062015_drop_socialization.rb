class DropSocialization < ActiveRecord::Migration
  def change
    drop_table :likes
    drop_table :mentions
    remove_column :comments, :likers_count
    remove_column :posts, :likers_count
    remove_column :users, :likees_count
  end
end
