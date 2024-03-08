class UpdateOwnerToUsers < ActiveRecord::Migration[7.1]
  def change
    change_column :users, :owner, :boolean, :default => false
  end
end
