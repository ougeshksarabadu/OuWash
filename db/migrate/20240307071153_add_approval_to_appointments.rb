class AddApprovalToAppointments < ActiveRecord::Migration[7.1]
  def change
    add_column :appointments, :approval, :boolean, :default => false
  end
end
