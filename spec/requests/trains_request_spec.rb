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
  let(:valid_attributes) do
    {
      "id" => train.id,
      "name" => "name",
      "train_model_name" => "train_model_name",
      "number_of_cars" => 1,
      "max_weight_capacity" => 100,
      "active" => true
    }
  end
  let(:invalid_attributes) do
    {
      "id" => train.id,
      "name" => "",
      "train_model_name" => "",
      "number_of_cars" => "",
      "max_weight_capacity" => "",
      "active" => nil
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

  describe 'POST /v1/trains' do
    context 'with valid attributes' do
      it 'returns http status 201' do
        post v1_trains_path params: { train: expected_response }
        expect(response).to be_created
        expect(JSON.parse(response.body)).to eq({"message"=>"#{train.name} successfully created"})
      end
    end

    context 'with invalid attributes' do
      it 'returns http status 422' do
        post v1_trains_path params: { train: invalid_attributes }
        expect(response).to have_http_status(422)
        expect(JSON.parse(response.body)).to eq({
          "errors"=>[
            {
              "name"=>[
                "can't be blank"
              ],
              "train_model_name"=>[
                "can't be blank"
              ],
              "number_of_cars"=>[
                "can't be blank",
                "is not a number"
              ],
              "max_weight_capacity"=>[
                "can't be blank",
                "is not a number"
              ],
              "active"=>[
                "is not included in the list"
              ]
            }
          ]
        })
      end
    end
  end

  describe 'PUT /v1/trains/1' do
    context 'with valid attributes' do
      it 'returns http status 200' do
        put v1_train_path(train), params: { train: valid_attributes }
        expect(response).to be_ok
        expect(JSON.parse(response.body)).to eq({"message"=>"name successfully updated"})
      end
    end

    context 'with invalid attributes' do
      it 'returns http status 422' do
        put v1_train_path(train), params: { train: invalid_attributes }
        expect(response).to have_http_status(422)
        expect(JSON.parse(response.body)).to eq({
          "errors"=>[
            {
              "name"=>[
                "can't be blank"
              ],
              "train_model_name"=>[
                "can't be blank"
              ],
              "number_of_cars"=>[
                "can't be blank",
                "is not a number"
              ],
              "max_weight_capacity"=>[
                "can't be blank",
                "is not a number"
              ],
              "active"=>[
                "is not included in the list"
              ]
            }
          ]
        })
      end
    end
  end

  describe 'DELETE /v1/trains/1' do
    it 'returns http status 200' do
      delete v1_train_path(train)
      expect(response).to be_ok
      expect(JSON.parse(response.body)).to eq({"message"=>"#{train.name} successfully deleted"})
    end
  end
end
