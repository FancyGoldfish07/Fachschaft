#Versioning model for EventRole model
class EventRoleVersion < PaperTrail::Version
 belongs_to :event_role
end