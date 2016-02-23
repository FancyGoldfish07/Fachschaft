class AddRolesToEvents < ActiveRecord::Migration
  def change
    create_table(:events_roles, :id => false) do |t|
      t.references :event
      t.references :role

    end
    add_index(:events_roles, [ :event_id, :role_id  ])
  end
end
