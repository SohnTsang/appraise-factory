class AddAgeFromPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :age, :date

  end
end
