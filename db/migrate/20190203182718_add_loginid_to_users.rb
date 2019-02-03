class AddLoginidToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :loginid, :string
  end
end
