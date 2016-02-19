#Event class for Calendar entries
class Event < ActiveRecord::Base
  has_and_belongs_to_many :roles
  belongs_to :event_category
end
