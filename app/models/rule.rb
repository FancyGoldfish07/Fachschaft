#Data model that is used to define single recurrence rule
class Rule < ActiveRecord::Base
  belongs_to :recurrence
  after_initialize :set_defaults


  #Returns the days of the week in German
  def self.DAYS
    ["Montag", "Dienstag","Mittwoch","Donnerstag","Freitag","Samstag", "Sonntag"]
  end
  #Converts the day attribute into a day symbol
  def getDay
    array = Rule.DAYS

    case array[day].to_s
      when "Montag"
       :monday
      when "Dienstag"
        :tuesday
      when "Mittwoch"
        :wednesday
      when "Donnerstag"
        :thursday
      when "Freitag"
        :friday
      when "Samstag"
        :saturday
      when "Sonntag"
        :sunday
    end
  end
  #Returns the Ice_Cube rule
  def getRule
    dayParam = getDay
    if self.month == 0
      #Rails week at least for now starts sundays
      IceCube::Rule.weekly(week).day(dayParam )
    else
      IceCube::Rule.monthly(month).day_of_week(day => [days])
      end
  end

  private
  def set_defaults
    if day.blank?
      self.day = 0
    end
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
