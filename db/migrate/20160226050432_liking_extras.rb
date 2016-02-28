class LikingExtras < ActiveRecord::Migration
  def change
      add_column :posts, :likers_count, :integer, :default => 0
      add_column :comments, :likers_count, :integer, :default => 0
  end
end
