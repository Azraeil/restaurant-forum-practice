class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :name

      t.timestamps
    end

    # add FK in Restaurant
    add_column :restaurants, :category_id, :integer
  end
end
