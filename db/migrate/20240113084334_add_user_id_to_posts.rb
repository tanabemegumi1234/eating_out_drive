class AddUserIdToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :user_id, :bigint
    add_index :posts, :user_id
  end
end
