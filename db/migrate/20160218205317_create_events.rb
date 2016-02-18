class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :date
      t.integer :priority
      t.boolean :flag
      t.string :imageURL
      t.string :externalLink
      t.string :revision
      t.string :typeOfDate
      t.datetime :editingDeadline
      t.string :userGroup

      t.timestamps null: false
    end
  end
end
