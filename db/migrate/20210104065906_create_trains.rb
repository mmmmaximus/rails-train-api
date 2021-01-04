class CreateTrains < ActiveRecord::Migration[6.0]
  def change
    create_table :trains do |t|
      t.string :name
      t.string :train_model_name
      t.integer :number_of_cars
      t.integer :max_weight_capacity
      t.boolean :active, default: false
      t.timestamps null: false
    end
  end
end
