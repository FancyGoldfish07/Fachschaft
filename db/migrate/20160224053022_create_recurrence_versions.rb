class CreateRecurrenceVersions < ActiveRecord::Migration
  def change
    create_table :recurrence_versions do |t|
      t.date :start
      t.date :end
      t.datetime :created_at
      t.string   :item_type, :null => false
      t.integer  :item_id,   :null => false
      t.string   :event,     :null => false
      t.string   :whodunnit
      t.text     :object
    end
    add_index :recurrence_versions,[:item_type,:item_id]
  end
end
