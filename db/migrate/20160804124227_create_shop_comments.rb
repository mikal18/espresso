class CreateShopComments < ActiveRecord::Migration[5.0]
  def change
    create_table :shop_comments do |t|
      t.string :heading
      t.text :body
      t.references :shop, foreign_key: true

      t.timestamps
    end
  end
end
