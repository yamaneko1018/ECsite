class AddUsersIdToHistories < ActiveRecord::Migration[5.2]
  def change
    add_column :histories, :users_id, :integer
  end
end
