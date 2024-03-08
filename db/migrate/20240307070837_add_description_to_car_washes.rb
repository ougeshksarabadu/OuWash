class AddDescriptionToCarWashes < ActiveRecord::Migration[7.1]
  def change
    add_column :car_washes, :description, :string
  end
end
