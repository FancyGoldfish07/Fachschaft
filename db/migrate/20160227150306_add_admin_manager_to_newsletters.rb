class AddAdminManagerToNewsletters < ActiveRecord::Migration
  def change
    add_column :newsletters, :unadmin_id, :integer,index:true, foreign_key: true
    add_column :newsletters, :unmanager_id, :integer,index:true, foreign_key: true
  end
end
