class Suspend < ActiveRecord::Migration
  def change
    create_table :suspends do |t|
      t.date :date


      t.timestamps null: false
  end
end
end