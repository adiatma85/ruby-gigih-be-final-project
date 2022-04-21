FactoryBot.define do
  factory :category do
    name { "Indonesian" }
  end

  factory :random_category, parent: :category do
    name { "Random with Faker" }
  end

  factory :invalid_category, parent: :category do
    name { nil }
  end
end
