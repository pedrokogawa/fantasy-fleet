class RenameStartDayToStartDate < ActiveRecord::Migration[7.1]
  def change
    rename_column :bookings, :start_day, :start_date
  end
end
