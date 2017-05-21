class AddApplicationIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :application_id, :integer
  end
end
