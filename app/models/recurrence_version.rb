#The versioning model for Recurrence
class RecurrenceVersion < PaperTrail::Version
  self.table_name = :recurrence_versions

  self.sequence_name = :recurrence_versions_id_seq
end