class RenameUsersIdColumnToHistories < ActiveRecord::Migration[5.2]
  def change
    rename_column :histories, :users_id, :user_id
  end
end
