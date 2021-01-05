require 'rails_helper'

describe 'Trains' do
  let!(:train) { create(:train) }
  let(:expected_collection_response) { [expected_response] }
  let(:expected_response) do
    {
      "id" => train.id,
      "name" => train.name,
      "train_model_name" => train.train_model_name,
      "number_of_cars" => train.number_of_cars,
      "max_weight_capacity" => train.max_weight_capacity,
      "active" => train.active
    }
  end

  describe 'GET /v1/trains' do
    it 'returns http status 200' do
      get v1_trains_path
      expect(response).to be_ok
      expect(JSON.parse(response.body)).to eq(expected_collection_response)
    end
  end

  describe 'GET /v1/trains/1' do
    it 'returns http status 200' do
      get v1_train_path(train)
      expect(response).to be_ok
      expect(JSON.parse(response.body)).to eq(expected_response)
    end
  end
end
