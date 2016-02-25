class CreateRuleVersions < ActiveRecord::Migration
  def change
    create_table :rule_versions do |t|
      t.integer :day
      t.integer :week
      t.datetime :created_at
      t.integer :recurrence_id
      t.string   :item_type, :null => false
      t.integer  :item_id,   :null => false
      t.string   :event,     :null => false
      t.string   :whodunnit
      t.text     :object
      t.references :rule, index: true, foreign_key: true
    end

  end
end
