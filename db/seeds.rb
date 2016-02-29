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
