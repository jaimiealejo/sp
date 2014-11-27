class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.datetime :sched
      t.text :remarks
      t.references :procedure

      t.timestamps
    end
    add_index :appointments, :procedure_id
  end
end
