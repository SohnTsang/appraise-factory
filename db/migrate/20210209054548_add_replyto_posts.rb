class AddReplytoPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :reply, :boolean, :default => false
  end
end
