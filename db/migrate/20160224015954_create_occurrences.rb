class CreateOccurrences < ActiveRecord::Migration
  def change
    create_table :occurrences do |t|
      t.string :title
      t.datetime :start
      t.integer :priority
      t.boolean :flag
      t.text :imageUrl
      t.text :url
      t.datetime :end
      t.text :ort
      t.text :description

      t.timestamps null: false
    end
  end
end
