#Data model that is used to define single recurrence rule
class Rule < ActiveRecord::Base
  belongs_to :recurrence
  after_initialize :set_defaults

  #Returns the days of the week in German
  def self.DAYS
    ["Montag", "Dienstag","Mittwoch","Donnerstag","Freitag","Samstag", "Sonntag"]
  end
  #Returns the Ice_Cube rule
  def getRule
    if self.month == 0
      #Rails week at least for now starts sundays
      IceCube::Rule.weekly(week).day((day +1) )
    else
      IceCube::Rule.monthly(month).day_of_week(day => [days])
      end
  end
  #Handles the default case where our week integer is 0 at startup
  def getWeek
    if week.present?
      week
    else
      1
      end

  end
  private
  def set_defaults
    if month.blank?
      self.month =0
    end
    if days.blank?
     self.days= 0
    end
    if week.blank?
     self.week= 1
    end
  end
end
