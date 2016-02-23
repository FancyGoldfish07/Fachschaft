class AddMonthToRules < ActiveRecord::Migration
  def change
    add_column :rules, :month, :integer
  end
end
