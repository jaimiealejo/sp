class ChangeSchedToString < ActiveRecord::Migration
  def up
  	change_column :appointments, :sched, :string
  end

  def down
  end
end
