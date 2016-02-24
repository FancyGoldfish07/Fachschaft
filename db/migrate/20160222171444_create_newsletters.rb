class CreateNewsletters < ActiveRecord::Migration
  def change
    create_table :newsletters do |t|
      t.string :subject
      t.text :description
      t.datetime :from
      t.datetime :to

      t.timestamps null: false
    end
  end
end
