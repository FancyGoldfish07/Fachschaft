#Is an event repeated? If so how often?
class Recurrence < ActiveRecord::Base
  include IceCube
  has_one :event
  has_many :rules
  #Allow us to edit rules
  accepts_nested_attributes_for :rules, reject_if: :all_blank, allow_destroy: true
#Get all appointments for our rules from start to end
  def getDates(startDate, endDate)
    schedule = IceCube::Schedule.new(startDate) do |s|
      rules.each do |rule|
      s.add_recurrence_rule(rule)
      end
      schedule.occurrences(endDate)
    end

  end
  #Gets all dates from now for the next six months
  def getDatesSixMonths(startDate)
    getDates(startDate,startDate + 6.months)
  end


end
