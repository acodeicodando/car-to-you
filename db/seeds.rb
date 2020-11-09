require 'faker'

[
  'admin@car-to-me.com',
  'employee@car-to-me.com'
].map do |email|
  User.create!(
    name: Faker::Name.name,
    email: email,
    password: 'asdqwe123',
    password_confirmation: 'asdqwe123'
  )
end
