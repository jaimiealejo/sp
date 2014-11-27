class CreatePatientRecord < ActiveRecord::Migration
  def up
    change_table :procedures do |t|
    	t.references :patient
    end
  end
end
