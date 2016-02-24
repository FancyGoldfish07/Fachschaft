class CreateRepeats < ActiveRecord::Migration
  def change
    create_table :repeats do |t|
      t.datetime :start
      t.datetime :end

      t.timestamps null: false
    end
  end
end
