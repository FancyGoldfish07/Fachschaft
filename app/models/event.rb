#Event class for Calendar entries
class Event < ActiveRecord::Base
  has_and_belongs_to_many :roles
  belongs_to :event_category
  after_initialize :set_default_priority, :if => :new_record?
  #The priority
  enum priority: [:highest, :high,:medium,:low,:lowest]
  private
  #Sets the default priority of the event
  def set_default_priority
self.priority ||= :medium
  end
end
