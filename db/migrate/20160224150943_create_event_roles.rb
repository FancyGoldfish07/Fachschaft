class CreateEventRoles < ActiveRecord::Migration
  def change
    create_table :event_roles do |t|
      t.references :event, index: true, foreign_key: true
      t.references :role, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
