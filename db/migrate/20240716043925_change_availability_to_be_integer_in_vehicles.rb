class ChangeAvailabilityToBeIntegerInVehicles < ActiveRecord::Migration[7.1]
  def change
    change_column :vehicles, :availability, 'integer USING CAST(availability AS integer)'
  end
end
