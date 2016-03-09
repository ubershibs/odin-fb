class AddIndexToPosts < ActiveRecord::Migration
  def change
    add_index :posts, [:postable_type, :postable_id]
  end
end
