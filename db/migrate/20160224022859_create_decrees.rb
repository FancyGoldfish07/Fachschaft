class CreateDecrees < ActiveRecord::Migration
  def change
    create_table :decrees do |t|
      t.integer :day
      t.integer :week

      t.timestamps null: false
    end
  end
end
