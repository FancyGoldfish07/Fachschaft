#Data model that is used to define single recurrence rule
class Rule < ActiveRecord::Base
  belongs_to :recurrence
  #Returns the days of the week in German
  def self.DAYS
    ["Montag", "Dienstag","Mittwoch","Donnerstag","Freitag","Samstag","Sonntag"]
  end
  #Returns the Ice_Cube rule
  def getRule
    if month = 0
      IceCube::Rule.weekly(week).day(day)
    else
      IceCube::Rule.monthly(month).day_of_week(day => days)
      end
  end
  #Handles the default case where our week integer is 0 at startup
  def getWeek
    if week = 0
      1
    else
     self.week
    end

  end
end
