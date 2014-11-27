class CreateProcedures < ActiveRecord::Migration
  def change
    create_table :procedures do |t|
      t.string :procedure
      t.string :tooth_no
      t.string :remarks
      t.date :date

      t.timestamps
    end
  end
end
