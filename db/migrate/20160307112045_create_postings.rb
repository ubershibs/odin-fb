class CreatePostings < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :postable_type
      t.integer :postable_id

      t.timestamps null: false
    end
  end
end
