class AddTotalAmountToHistories < ActiveRecord::Migration[5.2]
  def change
    add_column :histories, :total_amount, :integer
  end
end
