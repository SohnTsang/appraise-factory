class ChangeTypesinPosts < ActiveRecord::Migration[6.0]
  def change
    change_column :posts, :price, :integer
    change_column :posts, :size, :integer
    change_column :posts, :floor, :integer
    change_column :posts, :storey, :integer
    change_column :posts, :age, :integer
    change_column :posts, :total_unit, :integer
    change_column :posts, :budget, :integer
  end
end
