class ChangeColumnDefaultForTrains < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:trains, :active, false)
  end
end
