#Versioning model for Exclude model
class ExcludeVersion < PaperTrail::Version

    self.table_name = :exclude_versions
    default_scope { where.not(event: 'create') }
end