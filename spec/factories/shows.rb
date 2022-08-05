FactoryBot.define do
  factory :show do
    title { "MyString" }
    description { "MyString" }
    crunchyroll { false }
    netflix { false }
    funimation { false }
    episodes { 1 }
    airdate { "2022-07-15" }
    enddate { "2022-07-15" }
  end
end
