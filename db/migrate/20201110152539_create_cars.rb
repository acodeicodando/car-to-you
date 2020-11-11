class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.string :brand
      t.string :brand_id
      t.string :model
      t.string :model_id
      t.string :fipe_code
      t.string :fipe_id
      t.string :name
      t.string :lisence_plate
      t.string :model_year
      t.string :year_manufacture

      t.timestamps
    end
  end
end
