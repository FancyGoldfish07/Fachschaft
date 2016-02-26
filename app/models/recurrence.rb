#Is an event repeated? If so how often?
class Recurrence < ActiveRecord::Base
  include IceCube
  has_many :rules, autosave: true
  has_many :excludes, autosave: true
  has_many :events
  belongs_to :owner,  class_name: 'Event',
             foreign_key: 'owner_id'


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
