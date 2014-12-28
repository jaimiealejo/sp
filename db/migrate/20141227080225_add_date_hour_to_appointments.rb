class AddDateHourToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :date, :string
    add_column :appointments, :hour, :string
  end
end
