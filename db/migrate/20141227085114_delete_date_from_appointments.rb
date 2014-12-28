class DeleteDateFromAppointments < ActiveRecord::Migration
  def up
  	remove_column :appointments, :date
  end

  def down
  end
end
