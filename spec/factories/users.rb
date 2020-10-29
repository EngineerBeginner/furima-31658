FactoryBot.define do
  factory :user do
    nickname              {"taro"}
    email                 {"test_user@gmail.com"}
    password              {"a1a1a1"}
    password_confirmation {password}
    last_name             {"山田"}
    first_name            {"太郎"}
    last_name_kana        {"ヤマダ"}
    first_name_kana       {"タロウ"}
    birth_date            {"1990-10-10"}
  end
end