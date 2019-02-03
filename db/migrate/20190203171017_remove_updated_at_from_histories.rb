class RemoveUpdatedAtFromHistories < ActiveRecord::Migration[5.2]
  def change
    remove_column :histories, :updated_at, :datetime
  end
end
