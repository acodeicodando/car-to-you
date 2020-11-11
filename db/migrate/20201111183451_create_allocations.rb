class CreateAllocations < ActiveRecord::Migration[6.0]
  def change
    create_table :allocations do |t|
      t.references :car, null: false, foreign_key: true
      t.string :document
      t.datetime :start_at
      t.datetime :end_at

      t.timestamps
    end
  end
end
