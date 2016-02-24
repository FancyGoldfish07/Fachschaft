#The view equivalent to Rule
class Decree < ActiveRecord::Base
  belongs_to :repeat
  after_initialize :set_defaults

  #Returns the days of the week in German
  def self.DAYS
   Rule.DAYS
  end
  #Returns the Ice_Cube rule
  def getRule
    dayParam = day + 1
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
