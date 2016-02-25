#The versioning model for Recurrence
class RecurrenceVersion < PaperTrail::Version
  belongs_to :recurrence
end