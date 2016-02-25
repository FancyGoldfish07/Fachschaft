#The rule versioning model for rule model
class RuleVersion < PaperTrail::Version

    self.table_name = :rule_versions

    self.sequence_name = :rule_versions_id_seq

end