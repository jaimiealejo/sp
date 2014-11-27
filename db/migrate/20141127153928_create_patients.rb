class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :last_name
      t.string :first_name
      t.date :birthday
      t.string :contact
      t.boolean :sex
      t.string :status
      t.string :occupation

      t.timestamps
    end
  end
end
