#Event versioning for event model
class EventVersion < PaperTrail::Version
  self.table_name = :event_versions

  self.sequence_name = :event_versions_id_seq
end