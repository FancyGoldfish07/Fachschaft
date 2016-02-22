class CreateRules < ActiveRecord::Migration
  def change
    create_table :rules do |t|
      t.integer :day
      t.references :recurrence, index: true, foreign_key: {on_delete: :cascade}

      t.timestamps null: false
    end
  end
end
