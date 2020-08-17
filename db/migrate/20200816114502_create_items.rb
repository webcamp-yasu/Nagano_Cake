class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.timestamps
      t.string :name, null: false
      t.text :detail, null: false
      t.integer :genre_id, null: false
      t.integer :price, null: false
      t.string :image_id, null: false
      t.boolean :is_active, null: false, default: true
    end
  end
end
