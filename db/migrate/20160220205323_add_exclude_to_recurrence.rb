class AddExcludeToRecurrence < ActiveRecord::Migration
  def change
    add_reference :excludes,:recurrence,index:true, foreign_key: true
  end
end
