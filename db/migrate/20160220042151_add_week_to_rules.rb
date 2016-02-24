class AddWeekToRules < ActiveRecord::Migration
  def change
    add_column :rules, :week, :integer
  end
end
