class RenameToCreator2 < ActiveRecord::Migration
  def change
  	rename_column :comments, :user_id, :creator_id
  end
end
