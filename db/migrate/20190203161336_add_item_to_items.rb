class AddItemToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :item, :string
  end
end
