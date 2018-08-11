FactoryBot.define do
  factory User do
    name { Faker::Name }
    email 'foo@bar.com'
    password 'password'
  end
end
