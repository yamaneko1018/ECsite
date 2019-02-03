class AddQuantityToHistories < ActiveRecord::Migration[5.2]
  def change
    add_column :histories, :quantity, :integer
  end
end
