class AddActiveToTrains < ActiveRecord::Migration[6.0]
  def change
    add_column :trains, :active, :boolean
  end
end
