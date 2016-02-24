#Versioning model for Exclude model
class ExcludeVersion < PaperTrail::Version

    self.table_name = :exclude_versions

    self.sequence_name = :exclude_versions_id_seq
end