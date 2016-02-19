class CreateEventTyps < ActiveRecord::Migration
  def change
    create_table :event_typs do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
