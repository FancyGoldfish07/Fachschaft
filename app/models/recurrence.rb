#Is an event repeated? If so how often?
class Recurrence < ActiveRecord::Base
  include IceCube
  has_many :rules, autosave: true
  has_many :excludes, autosave: true
  has_many :events
  belongs_to :owner,  class_name: 'Event',
             foreign_key: 'owner_id'
#Unpublish an entire recurrrence
  def unpublish
    events.each do |event|
if event.recurring_but_no_owner
  #Only do this to the elements that are not the main parent node
      event.unpublish_revisions
  end
    end
  end
  #Allow us to edit rules
  accepts_nested_attributes_for :rules, reject_if: :all_blank, allow_destroy: true
  #Get all appointments for our rules from start to end
  def getDates(startDate, endDate)
    schedule = IceCube::Schedule.new(startDate) do |s|
      rules.each do |rule|
        s.add_recurrence_rule(rule.getRule)
      end
      return s.occurrences(endDate)
    end

  end
  #Get all dates of this recurrence from a start date
def getDatesFrom(date)
  return events.where("start >= ?", date)

end
  #Gets all the times of the recurrence object
  def getDatesAllInOne
    schedule = IceCube::Schedule.new(self.start) do |s|
      rules.each do |rule|
        s.add_recurrence_rule(rule.getRule)
      end
      if excludes.count > 0
        excludes.each do |exclude|
          s.add_exception_time exclude.date
        end
      end
      return s.occurrences(self.end)
    end
    end

    #Gets all dates from now for the next six months
    def getDatesSixMonths(startDate)
      return getDates(startDate, startDate + 6.months)
    end

    def getDatesStartFinish()
      return getDates(self.start, self.end)
    end


  end
