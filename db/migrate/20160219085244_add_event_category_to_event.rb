class AddEventCategoryToEvent < ActiveRecord::Migration
  def change
    add_reference :events,:event_category, index:true, foreign_key: true
  end
end
