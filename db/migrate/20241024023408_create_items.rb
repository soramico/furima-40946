class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.references :user,                null: false, foreign_key: true
      t.string     :product_name,        null: false
      t.text       :product_description, null: false
      t.integer    :category_id,         null: false
      t.integer    :condition_id,        null: false
      t.integer    :contribution_id,     null: false
      t.integer    :prefecture_id,       null: false
      t.integer    :deliveryday_id,      null: false
      t.integer    :price,               null: false
      t.timestamps
    end
  end
end
