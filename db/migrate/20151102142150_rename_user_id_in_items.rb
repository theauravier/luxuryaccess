class RenameUserIdInItems < ActiveRecord::Migration
  def change
    rename_column :items, :user_id, :owner_id
  end
end
