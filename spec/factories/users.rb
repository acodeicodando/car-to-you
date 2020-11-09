FactoryBot.define do
  factory :user do
    name { 'Administrator' }
    email { 'admin@car-to-me.com' }
    password { 'asdqwe123' }
    password_confirmation { 'asdqwe123' }
  end
end
