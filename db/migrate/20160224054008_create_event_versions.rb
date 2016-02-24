class CreateEventVersions < ActiveRecord::Migration
  def change
    create_table :event_versions do |t|
      t.string :title
      t.datetime :start
      t.integer :priority
      t.boolean :flag
      t.text :imageURL
      t.text :url
      t.datetime :end
      t.text :ort
      t.text :description
      t.boolean :repeats
      t.integer :event_category
      t.integer :recurrence_id
      t.datetime :created_at
      t.string   :item_type, :null => false
      t.integer  :item_id,   :null => false
    end
    add_index :event_versions,[:item_type,:item_id]
  end
end
