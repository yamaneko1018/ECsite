class AddItemsIdToHistories < ActiveRecord::Migration[5.2]
  def change
    add_column :histories, :items_id, :integer
  end
end
