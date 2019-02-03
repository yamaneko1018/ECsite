class AddUsernameKanaToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username_kana, :string
  end
end
