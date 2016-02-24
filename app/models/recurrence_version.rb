#The versioning model for Recurrence
class RecurrenceVersion < PaperTrail::Version
  self.table_name = :recurrence_versions
  default_scope { where.not(event: 'create') }

end