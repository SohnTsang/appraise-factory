class AddReadToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :read, :boolean, :default => true
  end
end
