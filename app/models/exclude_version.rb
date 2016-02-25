#Versioning model for Exclude model
class ExcludeVersion < PaperTrail::Version

   belongs_to :exclude
end