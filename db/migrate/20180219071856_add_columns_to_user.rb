class AddColumnsToUser < ActiveRecord::Migration[5.1]
  def change
    # add 3 columns to User
    add_column :users, :name, :string
    add_column :users, :intro, :text
    # 使用者大頭貼
    add_column :users, :avatar, :string
  end
end
