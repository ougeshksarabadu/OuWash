class UpdateLuxuryPriceInCarWashes < ActiveRecord::Migration[7.1]
  def change
    remove_column :car_washes, :price_luxury
    add_column :car_washes, :price_luxury, :integer
  end
end
