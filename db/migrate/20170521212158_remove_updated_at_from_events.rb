class RemoveUpdatedAtFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :updated_at, :datetime
  end
end
