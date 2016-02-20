class Rule < ActiveRecord::Base
  belongs_to :recurrence
  #Returns the days of the week in German
  def self.DAYS
    ["Montag", "Dienstag","Mittwoch","Donnerstag","Freitag","Samstag","Sonntag"]
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
