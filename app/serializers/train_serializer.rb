class TrainSerializer < ActiveModel::Serializer
  attributes :id, :name, :train_model_name, :number_of_cars, :max_weight_capacity, :active
end
