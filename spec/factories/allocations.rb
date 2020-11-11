FactoryBot.define do
  factory :allocation do
    car { nil }
    document { "MyString" }
    start_at { "2020-11-11 15:34:51" }
    end_at { "2020-11-11 15:34:51" }
  end
end
