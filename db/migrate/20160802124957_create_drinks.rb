class CreateDrinks < ActiveRecord::Migration[5.0]
  def change
    create_table :drinks do |t|
      t.string :name
      t.string :kind_of_drink
      t.string :roast
      t.string :flavor
      t.references :shop, foreign_key: true

      t.timestamps
    end
  end
end
