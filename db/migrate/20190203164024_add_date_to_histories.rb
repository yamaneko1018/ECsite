class AddDateToHistories < ActiveRecord::Migration[5.2]
  def change
    add_column :histories, :date, :datetime
  end
end
