class V1::TrainsController < ApplicationController
  def index
    trains = Train.all
    render json: trains, each_serializer: TrainSerializer
  end

  def show
    train =  Train.find(params[:id])
    render json: train, each_serializer: TrainSerializer
  end

  def create
  end

  def update
  end

  def delete
  end

  private
  def train_params
    params.require(:train).permit(:name, :train_model_name, :number_of_cars, :max_weight_capacity, :active)
  end
end
