class RemoveStatusFromTrains < ActiveRecord::Migration[6.0]
  def change
    remove_column :trains, :status, :integer
  end
end
