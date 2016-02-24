class AddReviewedToEvents < ActiveRecord::Migration
  def change
    add_column :events, :reviewed, :boolean
  end
end
