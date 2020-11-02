require 'faker'
#Creates 10 users with random values
10.times do
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Lorem.sentence(word_count: 50 + rand(200)), email: Faker::Internet.email(domain: 'yopmail.com'))
end