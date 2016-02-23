class AddDaysToRules < ActiveRecord::Migration
  def change
    add_column :rules, :days, :integer
  end
end
