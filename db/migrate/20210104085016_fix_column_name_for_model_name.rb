class FixColumnNameForModelName < ActiveRecord::Migration[6.0]
  def change
    rename_column :trains, :model_name, :train_model_name
  end
end
