class CreateVehicles < ActiveRecord::Migration[7.1]
  def change
    create_table :vehicles do |t|
      t.string :name
      t.string :category
      t.integer :seats
      t.integer :speed
      t.integer :price_per_day
      t.string :description
      t.string :location
      t.string :availability
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
