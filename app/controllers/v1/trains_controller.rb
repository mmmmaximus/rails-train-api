class V1::TrainsController < ApplicationController
  def index
    trains = Train.all
    render json: trains, each_serializer: TrainSerializer
  end

  def show
    train = Train.find(params[:id])
    render json: train, each_serializer: TrainSerializer
  end

  def create
    train = Train.new(train_params)

    if train.save
      render json: { message: "#{train.name} successfully created" }, status: :created
    else
      render json: { errors: [train.errors] }, status: :unprocessable_entity
    end
  end

  def update
    train = Train.find(params[:id])

    if train.update(train_params)
      render json: { message: "#{train.name} successfully updated" }, status: :ok
    else
      render json: { errors: [train.errors] }, status: :unprocessable_entity
    end
  end

  def destroy
    train = Train.find(params[:id])
    train.destroy

    render json: { message: "#{train.name} successfully deleted" }, status: :ok
  end

  private
  def train_params
    params.require(:train).permit(:name, :train_model_name, :number_of_cars, :max_weight_capacity, :active)
  end
end
