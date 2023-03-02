class CreateFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :foods do |t|
      t.string :food_name
      t.string :dessert_pairing
      t.integer :restaurant_id
      t.timestamps
    end
  end
end
