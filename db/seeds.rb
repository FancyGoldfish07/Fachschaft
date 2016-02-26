# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Role.create([{ name: 'User' }, { name: 'Fachschaft' },{name: 'Manager'},{name:"Admin"}])
EventCategory.create([{name: 'Fachschaftssitzung'}, {name: 'Party'}])
event1 = Event.create(start: Time.now + 1.day,title: "Testtermin",event_category: EventCategory.first)
event1.save
event2 = Event.create(start: Time.now + 2.day,title: "Party Party Paty",event_category: EventCategory.first)
event2.save