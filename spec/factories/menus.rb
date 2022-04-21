require 'factory_bot'
FactoryBot.define do
  factory :menu do
    name { "Nasi Uduk" }
    description { "Betawi style steamed rice cooked in coconut milk. Delicious!" }
    price { 10000.0 }
  end

  factory :random_menu, parent: :menu do
    name { Faker::Food.dish }
    description { Faker::Food.description }
    price { 10000.0 }
  end

  factory :invalid_menu, parent: :menu do
    name { nil }
    description { nil }
    price { 10000.0 }
  end
end
