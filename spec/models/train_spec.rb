require 'rails_helper'

describe Train do
  describe 'train validations' do
    subject { build(:train) }
    it { is_expected.to be_valid }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:train_model_name) }
    it { is_expected.to validate_presence_of(:number_of_cars) }
    it { is_expected.to validate_presence_of(:max_weight_capacity) }

    it do
      expect(subject).to validate_numericality_of(:number_of_cars).is_greater_than_or_equal_to(1).is_less_than_or_equal_to(20)
    end
    it do
      expect(subject).to validate_numericality_of(:max_weight_capacity).is_greater_than_or_equal_to(100).is_less_than_or_equal_to(1000)
    end
  end
end
