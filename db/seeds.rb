# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Create Roles on startup.
Role.create([{ name: 'User' }, { name: 'Fachschaft' },{name: 'Manager'},{name:"Admin"}])

# Create event categories on startup.
EventCategory.create([{name: 'Fachschaftssitzung'}, {name: 'Party'}])

# Create sample events on startup (only needed for the deployment on Heroku and testing purposes)
event1 = Event.create(start: Time.now + 1.day,title: "Testtermin",event_category: EventCategory.first)
event1.save
event2 = Event.create(start: Time.now + 2.day,title: "Party Party Paty",event_category: EventCategory.first)
event2.save
event3 = Event.create(start:Time.now + 1.hour, end: Time.now+3.hour,title: "Example", event_category: EventCategory.last,
                      imageURL:"https://i.ytimg.com/vi/icIeIJhpxLc/maxresdefault.jpg", url:"http://winfuture.de/downloadvorschalt,3527.html",
                      description: "Party Hard")
event3.save

# Create test-users for Heroku
user1 = User.create(email:"admin@example.com", password: "AdminSparten123", username:"testadmin")
user1.save

user2 = User.create(email:"manager@example.com", password: "ManagerSparten123", username:"testmanager", )
user2.save
user2.setRole("Manager")

user3 = User.create(email: "user@example.com", password:"UserSparten123", username:"testuser")
user3.save
user3.setRole("User")