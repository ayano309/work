class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.integer :category_id, null: false
      t.string :name, null: false
      t.text :description, null: false, default: "商品説明"
      t.integer :price, null: false
      t.boolean :soldout_flag, null: false, default: false
      t.timestamps
    end
  end
end
