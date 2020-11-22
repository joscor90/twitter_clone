class AddUniqueToFriends < ActiveRecord::Migration[5.2]
  def change
    add_index :friends, [:user_id, :friend_id], unique: true
  end
end
