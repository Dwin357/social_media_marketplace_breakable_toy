# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Patron.destroy_all if Patron.any?
LoginCredential.destroy_all if LoginCredential.any?
Venue.destroy_all if Venue.any?
Event.destroy_all if Event.any?

bm = Patron.create!({name: "Bruce", username: "Batman", email: "bruce@wayne.co"})

bm.login = LoginCredential.create(password: "joker")

metro = Venue.create!({name: "metro", username: "metro_admin"})

metro.login = LoginCredential.create(password: "house wins")

5.times do |count|
  Event.create!(
    name: "Party #{count}", 
    venue: metro, 
    description: "party up in here", 
    ticket_price: count, 
    ticket_max: (10-count)
  )
end