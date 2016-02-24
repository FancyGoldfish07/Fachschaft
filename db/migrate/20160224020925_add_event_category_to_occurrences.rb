class AddEventCategoryToOccurrences < ActiveRecord::Migration
  def change
    add_reference :occurrences, :event_category, index:true, foreign_key: true
  end
end
