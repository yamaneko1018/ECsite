class AddIndexToUsersLoginid < ActiveRecord::Migration[5.2]
  def change
    add_index :users,:loginid,unique:true
  end
end
