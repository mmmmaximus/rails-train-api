class Train < ApplicationRecord
  validates :name, presence: true
  validates :train_model_name, presence: true
  validates :number_of_cars, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :max_weight_capacity, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :active, inclusion: { in: [ true, false ] }
end
