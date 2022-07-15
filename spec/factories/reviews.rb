FactoryBot.define do
  factory :review do
    message { "MyString" }
    rating { 1 }
    user { nil }
  end
end
