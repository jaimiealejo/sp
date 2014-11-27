class CreateProcedures < ActiveRecord::Migration
  def change
    create_table :procedures do |t|
      t.string :procedure
      t.string :tooth_no
      t.text :remarks
      t.date :date
      t.references :patient

      t.timestamps
    end
    add_index :procedures, :patient_id
  end
end
