class RenameUserToCreator < ActiveRecord::Migration
  def change
  	# rename_column(table, old_column_name, new_column_name) 修改欄位名稱
  	# add_column :users, :created_at, :datetime
  	rename_column :posts, :user_id, :creator_id
  end
end
