class AddThoughtsToDrinks < ActiveRecord::Migration[5.0]
  def change
    add_column :drinks, :thoughts, :text
  end
end
