#The rule versioning model for rule model
class RuleVersion < PaperTrail::Version

   belongs_to :rule

end