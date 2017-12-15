# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Photo.destroy_all
Category.destroy_all
Event.destroy_all
User.destroy_all

user1 = User.create!(email: "elexilon@elexilon.com", password: "123456")
user2 = User.create!(email: "oliver@elexilon.com", password: "123456")

users_count = User.count
puts "#{users_count} users were created."

modern_and_minimal = Category.create!(name: "Modern and Minimal")
sleek_and_sophisticated = Category.create!(name: "Sleek and Sophisticated")
warm_and_cozy = Category.create!(name: "Warm and Cozy")
event_with_a_view = Category.create!(name: "event with a View")
elegant_and_ornate = Category.create!(name: "Elegant and Ornate")
a_mans_touch = Category.create!(name: "A Man's Touch")
white_washed = Category.create!(name: "White Washed")
tempting_terrace = Category.create!(name: "Tempting Terrace")


eves = Event.create!([
  { name: "Iguanodon", description: "A "*225,user: user1, starts_at: DateTime.now,
    ends_at: DateTime.now.next_day(1), categories: [modern_and_minimal, sleek_and_sophisticated, tempting_terrace],
    location: "Amsterdam", capacity: 10, active: true},
  { name: "Mosasaurus", description: "B "*225,user: user2, starts_at: DateTime.now,
    ends_at: DateTime.now.next_day(1), categories: [warm_and_cozy, elegant_and_ornate],
    location: "Amsterdam", capacity: 10, active: true},
  { name: "Hungarosaurus", description: "C "*225,user: user1, starts_at: DateTime.now,
    ends_at: DateTime.now.next_day(1), categories: [white_washed, tempting_terrace],
    location: "Amsterdam", capacity: 10, active: true},
])

event_count = Event.count
puts "#{event_count} events were created."

photo1 = Photo.create!(remote_image_url: "http://res.cloudinary.com/elexilon/image/upload/v1513264380/red-rocks-winter-concert-1_567ca252-f0ae-5102-065b6b925d495a29_tq5vqx.jpg", event: eves[1])
photo2 = Photo.create!(remote_image_url: "http://res.cloudinary.com/elexilon/image/upload/v1513264377/heavy-k-720x431_hhjhyu.jpg", event: eves[1])
photo3 = Photo.create!(remote_image_url: "http://res.cloudinary.com/elexilon/image/upload/v1513264377/image_dxhuae.jpg", event: eves[1])

photo4 = Photo.create!(remote_image_url: "http://res.cloudinary.com/elexilon/image/upload/v1513264377/PROD-Waving-during-the-concert_rxdpob.jpg", event: eves[2])
photo5 = Photo.create!(remote_image_url: "http://res.cloudinary.com/elexilon/image/upload/v1513264377/berghain_kl6ouf.jpg", event: eves[2])
photo6 = Photo.create!(remote_image_url: "http://res.cloudinary.com/dnwkjak4p/image/upload/v1476007287/20161005-zsogv_l4urst.png", event: eves[2])

photo7 = Photo.create!(remote_image_url: "http://res.cloudinary.com/elexilon/image/upload/v1513264380/red-rocks-winter-concert-1_567ca252-f0ae-5102-065b6b925d495a29_tq5vqx.jpg", event: eves[0])
photo8 = Photo.create!(remote_image_url: "http://res.cloudinary.com/elexilon/image/upload/v1513264377/heavy-k-720x431_hhjhyu.jpg", event: eves[0])
photo9 = Photo.create!(remote_image_url: "http://res.cloudinary.com/elexilon/image/upload/v1513264377/image_dxhuae.jpg", event: eves[0])
