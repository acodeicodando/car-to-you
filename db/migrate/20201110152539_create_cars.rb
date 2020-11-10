class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.string :car_model
      t.integer :car_model_id
      t.string :brand
      t.integer :brand_id
      t.string :lisence_plate
      t.date :car_model_year
      t.integer :car_year_manufacture

      t.timestamps
    end
  end
end
