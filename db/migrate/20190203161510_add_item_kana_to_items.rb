class AddItemKanaToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :item_kana, :string
  end
end
