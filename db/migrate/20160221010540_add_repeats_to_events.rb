class AddRepeatsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :repeats, :boolean
  end
end
