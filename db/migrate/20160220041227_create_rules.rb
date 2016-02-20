class CreateRules < ActiveRecord::Migration
  def change
    create_table :rules do |t|
      t.integer :mode
      t.integer :day
      t.references :recurrence, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
