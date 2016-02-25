#Versioning model for EventRole model
class EventRoleVersion < PaperTrail::Version
 belongs_to :event_role
 belongs_to :event_version
 belongs_to :role
end