class Articles2 < ActiveRecord::Migration[7.1]
  def change
    create_table :articles2 do |t|
      t.integer :store_number, null: false
      t.string :dan, null: false
      t.text :name, null: false
      t.decimal :price, null: false
      t.timestamps

      t.index [:store_number, :dan], unique: true
    end
  end
end
