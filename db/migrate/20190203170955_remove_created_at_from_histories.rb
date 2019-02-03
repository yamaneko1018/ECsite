class RemoveCreatedAtFromHistories < ActiveRecord::Migration[5.2]
  def change
    remove_column :histories, :created_at, :datetime
  end
end
