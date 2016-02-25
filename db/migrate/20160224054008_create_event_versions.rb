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
      t.integer :event_category_id
      t.integer :recurrence_id
      t.datetime :created_at
      t.string   :item_type, :null => false
      t.integer  :item_id,   :null => false
      t.string   :event,     :null => false
      t.string   :whodunnit
      t.text     :object
      t.integer :user_id
      t.integer :admin_id
      t.integer :manager_id
      t.integer :state
      t.text :message
      t.references :event, index: true, foreign_key: true
    end

  end
end
