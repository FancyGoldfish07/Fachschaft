class AddRecurrenceToEvent < ActiveRecord::Migration
  def change
    add_reference :events,:recurrence, index:true, foreign_key: true
  end
end
