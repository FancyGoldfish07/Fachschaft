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


# Create test-users for Heroku
admin = User.create(email:"admin@example.com", password: "Sparten123", username:"testadmin")
admin.save

manager = User.create(email:"manager@example.com", password: "Sparten123", username:"testmanager", )
manager.save
manager.setRole("Manager")


fachschaft = User.create(email:"fachschaft@example.com", password: "Sparten123", username:"testfachschaft", )
fachschaft.save
fachschaft.setRole("Fachschaft")

user = User.create(email: "user@example.com", password:"UserSparten123", username:"testuser")
user.save
# automatically sets role to user.


# Create sample events on startup (only needed for the deployment on Heroku and testing purposes)
event1 = Event.create(start: Time.now + 1.day,title: "Testtermin",event_category: EventCategory.first, description:"FUCK THIS SHIT! I'm OUT!")
event1.save
# Change state of event1 to waiting for review
event1.changeState(fachschaft)


event2 = Event.create(start: Time.now + 2.day,title: "Party Party Paty",event_category: EventCategory.first,  description:"FUCK THIS SHIT! I'm OUT!")
event2.save
# Change state of event2 to waiting and then to reviewed meaning waiting to be published
event2.changeState(fachschaft)
event2.changeState(admin)




# Create some fancy example events that are already reviewed and published.
event3 = Event.create(start:Time.now + 1.hour, end: Time.now+3.hour,title: "Example FACHSCHAFT", flag: true,  description:"FUCK THIS SHIT! I'm OUT!", event_category: EventCategory.first,
                      imageURL:"https://i.ytimg.com/vi/icIeIJhpxLc/maxresdefault.jpg", url:"http://winfuture.de/downloadvorschalt,3527.html",
                      description: "Party Hard")
event3.save
event3.changeState(fachschaft)
event3.changeState(admin)
event3.reviewed
event3.admin=admin
event3.submitted!
event3.publish

event4 = Event.create(start:Time.now + 5.hour, end: Time.now+15.hour,title: "Example PARTY", description:"FUCK THIS SHIT! I'm OUT!", event_category: EventCategory.first,
                                    imageURL:"https://i.ytimg.com/vi/icIeIJhpxLc/maxresdefault.jpg", url:"http://winfuture.de/downloadvorschalt,3527.html",
                                    description: "Party Hard")
event4.save
event4.changeState(fachschaft)
event4.changeState(admin)
event4.reviewed
event4.admin=admin
event4.submitted!
event4.publish