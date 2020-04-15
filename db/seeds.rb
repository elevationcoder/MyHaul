# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Driver.destroy_all
Offer.destroy_all

u = User.create!(email: 'test@test.com', password: 'x')

d = Driver.create!(name: "Bill", truck_type: "Pickup", truck_size: "medium")

o = u.offers.create!(due_date: Time.now + 5.hours, driver: d, price_offer: 100)

o2 = u.offers.create!(due_date: Time.now + 8.hours, price_offer: 400)





