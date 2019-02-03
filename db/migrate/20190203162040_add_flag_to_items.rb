class AddFlagToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :flag, :string
  end
end
