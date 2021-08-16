class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name, null: false
      t.text   :explanation, null: false
      t.integer :category_id, null: false
      t.integer :place_id, null: false
      t.integer :make_day_id, null: false
      t.integer :value, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
