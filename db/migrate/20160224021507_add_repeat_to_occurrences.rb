class AddRepeatToOccurrences < ActiveRecord::Migration
  def change
    add_reference :occurrences,:repeat, index:true, foreign_key: true
  end
end
