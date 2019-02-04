class RenameItemsIdColumnToHistories < ActiveRecord::Migration[5.2]
  def change
    rename_column :histories, :items_id, :item_id
  end
end
