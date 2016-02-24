#Versioning model for EventRole model
class EventRoleVersion < PaperTrail::Version
  self.table_name = :event_role_versions

  self.sequence_name = :event_role_versions_id_seq
end