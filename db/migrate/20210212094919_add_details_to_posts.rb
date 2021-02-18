class AddDetailsToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :condo_name, :string
    add_column :posts, :price, :float
    add_column :posts, :size, :float
    add_column :posts, :floor, :float
    add_column :posts, :storey, :float
    add_column :posts, :age, :float
    add_column :posts, :total_unit, :float
    add_column :posts, :city, :string
    add_column :posts, :station, :string
    add_column :posts, :budget, :float
    add_column :posts, :floor_plan, :string
  end
end
