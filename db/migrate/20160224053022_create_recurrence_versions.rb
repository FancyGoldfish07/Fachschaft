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
      t.references :recurrence, index: true, foreign_key: true
    end

  end
end
