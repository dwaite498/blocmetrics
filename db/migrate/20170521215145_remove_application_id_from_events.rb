class RemoveApplicationIdFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :application_id, :integer
  end
end
