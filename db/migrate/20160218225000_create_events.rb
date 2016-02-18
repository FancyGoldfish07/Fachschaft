class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :start
      t.integer :priority
      t.boolean :flag
      t.text :imageURL
      t.text :url
      t.integer :repeat
      t.integer :typeOfDate
      t.datetime :end
      t.integer :userGroup

      t.timestamps null: false
    end
  end
end
