class AddUpdatedByToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :updated_by, :string
  end
end
