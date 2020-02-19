# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Event.destroy_all
Attendance.destroy_all
ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end
Faker::UniqueGenerator.clear

print "Beginning User Gen ..."
until User.count == 10
  name = Faker::Name.unique.name
  User.create(first_name: name.split.first, last_name: name.split.last, description: Faker::Lorem.sentence(word_count: 10), email: name.downcase.split.join + "@yopmail.com", password: "123456", password_confirmation: "123456")
end
puts 'Ok'

print "Beginning Event Gen ..."
until Event.count == 20
#5.times do
  e = Event.create(start_date: Faker::Date.forward(days: 30).to_datetime, duration: rand(1..60)*5, title: Faker::TvShows::RickAndMorty.quote, description: Faker::Lorem.sentence(word_count: 10), price: rand(1..1000), location: Faker::Address.city, admin: User.all.sample)
end
puts 'Ok'

print "Beginning Attendance Gen ..."
until Attendance.count == 10
  Attendance.create(user: User.all.sample, event: Event.all.sample)
end
puts 'Ok'