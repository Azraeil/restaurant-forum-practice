class CreateFriendships < ActiveRecord::Migration[5.1]
  def change
    create_table :friendships do |t|
      # 設定外鍵名稱
      # 來自 User model
      t.integer :user_id

      # 來自 Friendship model
      # 暫時這樣命名
      t.integer :friend_target_id

      t.timestamps
    end
  end
end
