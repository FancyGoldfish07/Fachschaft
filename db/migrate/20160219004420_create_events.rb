class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :start
      t.integer :priority
      t.boolean :flag
      t.text :imageURL
      t.text :url
      t.datetime :end
      t.text :ort
      t.text :description

      t.timestamps null: false
    end
  end
end
