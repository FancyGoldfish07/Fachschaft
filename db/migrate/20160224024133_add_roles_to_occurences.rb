class AddRolesToOccurences < ActiveRecord::Migration
  def change
    create_table(:occurrences_roles, :id => false) do |t|
      t.references :occurrence
      t.references :role
    end

    add_index(:occurrences_roles, [ :occurrence_id, :role_id  ])
    end
  end

