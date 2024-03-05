class CreateCarWashes < ActiveRecord::Migration[7.1]
  def change
    create_table :car_washes do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :location
      t.integer :price_sedan
      t.integer :price_suv
      t.integer :price_truck
      t.string :price_luxury

      t.timestamps
    end
  end
end
