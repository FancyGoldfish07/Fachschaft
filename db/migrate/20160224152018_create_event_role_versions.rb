class CreateEventRoleVersions < ActiveRecord::Migration
  def change
    create_table :event_role_versions do |t|
      t.integer :event_id
      t.integer :role_id
      t.datetime :created_at
      t.string   :item_type, :null => false
      t.integer  :item_id,   :null => false
      t.string   :event,     :null => false
      t.string   :whodunnit
      t.text     :object
      t.references :event_role, index: true, foreign_key: true
    end

  end
end
