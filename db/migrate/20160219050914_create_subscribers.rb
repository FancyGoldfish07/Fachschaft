class CreateSubscribers < ActiveRecord::Migration
  def change
    create_table :subscribers do |t|
      t.string :email
      t.timestamp :date

      t.timestamps null: false
    end
  end
end
