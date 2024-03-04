class CreateCars < ActiveRecord::Migration[7.1]
  def change
    create_table :cars do |t|
      t.string :type
      t.string :brand
      t.integer :year
      t.references :user_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
