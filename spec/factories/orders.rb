FactoryBot.define do
  factory :order do
    email { "example_email@gmail.com" }
    # Unnecesarry field below
    # total { 1.5 }
    # status { 1 }
  end

  factory :invalid_order_with_invalid_email, parent: :order do
    email { "admin" }
  end

  factory :invalid_order_with_nil, parent: :order do
    email { nil }
  end
end
