class ChangeDatatypePost < ActiveRecord::Migration[6.0]
  def change
    change_column :posts, :age, :date

  end
end
