class ChangeTypeColumn < ActiveRecord::Migration[7.1]
  def change
    remove_column :cars, :type
    add_column :cars, :car_type, :string
  end
end
