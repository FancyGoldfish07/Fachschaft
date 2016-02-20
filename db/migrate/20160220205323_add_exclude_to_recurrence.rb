class AddExcludeToRecurrence < ActiveRecord::Migration
  def change
    add_reference :recurrences,:exclude,index:true, foreign_key: true
  end
end
