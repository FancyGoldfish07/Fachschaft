class CreateRecurrences < ActiveRecord::Migration
  def change
    create_table :recurrences do |t|
      t.date :start
      t.date :end
      t.timestamps null: false
    end
  end
end
