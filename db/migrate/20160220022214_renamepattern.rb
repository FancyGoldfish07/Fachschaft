class Renamepattern < ActiveRecord::Migration
  def change
    rename_column :recurrences, :pattern, :schedule
  end
end
