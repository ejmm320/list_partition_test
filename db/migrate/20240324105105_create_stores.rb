class CreateStores < ActiveRecord::Migration[7.1]
  def change
    create_table :stores do |t|
      t.string :number, null: false
      t.string :name, null: false
      t.date :start_date, null: false
      t.timestamps
    end
  end
end
