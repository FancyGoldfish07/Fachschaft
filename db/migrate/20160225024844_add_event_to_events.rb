class AddEventToEvents < ActiveRecord::Migration
  def change
    add_column :events,:parent_id,:integer, index:true, foreign_key: true
    add_column :events, :user_id, :integer,index:true, foreign_key: true
    add_column :events, :admin_id, :integer,index:true, foreign_key: true
    add_column :events, :manager_id, :integer,index:true, foreign_key: true
    add_column :events, :state, :integer
    add_column :events, :message, :text
    add_column :events, :unadmin_id, :integer,index:true, foreign_key: true
    add_column :events, :unmanager_id, :integer,index:true, foreign_key: true

    add_column :recurrences, :owner_id, :integer,index:true, foreign_key: true
  end
end
