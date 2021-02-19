class RemoveAgeFromPosts < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :age, :float
  end
end
