FactoryBot.define do
  factory :user do
    username { "MyString" }
    email { "MyString" }
    password_digest { "MyString" }
    firstname { "MyString" }
    lastname { "MyString" }
    admin { false }
  end
end
