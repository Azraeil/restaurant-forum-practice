class CreateFollowships < ActiveRecord::Migration[5.1]
  def change
    create_table :followships do |t|
      t.integer :user_id
      t.integer :follow_target_id

      t.timestamps
    end
  end
end
