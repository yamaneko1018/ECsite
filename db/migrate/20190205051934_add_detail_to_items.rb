class AddDetailToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :detail, :string
  end
end
