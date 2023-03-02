class CreateRestaurants < ActiveRecord::Migration[6.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :description
      t.integer :rating
      t.string :location
      t.timestamps
    end
  end
end
