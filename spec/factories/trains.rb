FactoryBot.define do
  factory :train do
    name { FFaker::Name.name }
    train_model_name { FFaker::Name.name }
    number_of_cars { rand(10..20) }
    max_weight_capacity { rand(100..1000) }
    active

    trait :active do
      active { true }
    end

    trait :inactive do
      active { false }
    end
  end
end
