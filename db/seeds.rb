# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



Event.destroy_all
User.destroy_all

user1 = User.create!(email: "elexilon@elexilon.com", password: "123456")
user2 = User.create!(email: "oliver@elexilon.com", password: "123456")

users_count = User.count
puts "#{users_count} users were created."

Event.create!([
  { name: "Iguanodon", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages.",user: user1, starts_at: DateTime.now.to_date, ends_at: DateTime.now.next_day(1).to_date   },
  { name: "Mosasaurus", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages.",user: user2, starts_at: DateTime.now.to_date, ends_at: DateTime.now.next_day(1).to_date  },
  { name: "Hungarosaurus", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages.",user: user1, starts_at: DateTime.now.to_date, ends_at: DateTime.now.next_day(1).to_date  },
])

event_count = Event.count
puts "#{event_count} events were created."
