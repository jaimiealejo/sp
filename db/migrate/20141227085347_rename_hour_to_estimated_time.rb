class RenameHourToEstimatedTime < ActiveRecord::Migration
  def up
  	rename_column :appointments, :hour, :est_time
  end

  def down
  end
end
