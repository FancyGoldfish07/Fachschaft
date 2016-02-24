#Event versioning for event model
class EventVersion < PaperTrail::Version
  self.table_name = :event_versions
  default_scope { where.not(event: 'create') }

end