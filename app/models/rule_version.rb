#The rule versioning model for rule model
class RuleVersion < PaperTrail::Version

    self.table_name = :rule_versions
    default_scope { where.not(event: 'create') }

end