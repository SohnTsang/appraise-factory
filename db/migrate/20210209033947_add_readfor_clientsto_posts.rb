class AddReadforClientstoPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :readforclients, :boolean, :default => false
  end
end
