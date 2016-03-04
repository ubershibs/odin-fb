class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :from, :string
    add_column :users, :gender, :string
  end
end
