FactoryBot.define do
  factory :order do
    email { "MyString" }
    total { 1.5 }
    status { 1 }
  end
end
