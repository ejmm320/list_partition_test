class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table(
      :articles,
      primary_key: [:store_number, :dan],
      options: "PARTITION BY LIST(store_number)"
    ) do |t|
      t.integer :store_number, null: false
      t.string :dan, null: false
      t.text :name, null: false
      t.decimal :price, null: false
      t.timestamps
    end
  end
end
