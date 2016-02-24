class AddRepeatToSuspends < ActiveRecord::Migration
  def change
    add_reference :suspends,:repeat,index:true, foreign_key: true
  end
end
