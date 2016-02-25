class CreateExcludeVersions < ActiveRecord::Migration
  def change
    create_table :exclude_versions do |t|
      t.string   :whodunnit
      t.date :date
      t.datetime :created_at
      t.integer :recurrence_id
      t.string   :item_type, :null => false
      t.integer  :item_id,   :null => false
      t.string   :event,     :null => false
      t.string   :whodunnit
      t.text     :object
      t.references :exclude, index: true, foreign_key: true
    end

  end
end
