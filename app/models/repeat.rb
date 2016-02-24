#The view equivalent to Recurrence
class Repeat < ActiveRecord::Base
  include IceCube
  has_many :decrees
  has_many :suspends
  has_many :occurrences

  #Allow us to edit rules
  accepts_nested_attributes_for :decrees, reject_if: :all_blank, allow_destroy: true


  #Gets all the times of the recurrence object
  def getDatesAllInOne
    schedule = IceCube::Schedule.new(self.start) do |s|
      decrees.each do |rule|
        s.add_recurrence_rule(rule.getRule)
      end
      if suspends.count > 0
        suspends.each do |exclude|
          s.add_exception_time exclude.date
        end
      end
      return s.occurrences(self.end)
    end
  end



end
