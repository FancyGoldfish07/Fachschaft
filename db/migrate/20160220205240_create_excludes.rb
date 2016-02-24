class CreateExcludes < ActiveRecord::Migration
  def change
    create_table :excludes do |t|
      t.date :date

      t.timestamps null: false
    end
  end
end
