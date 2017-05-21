class RemoveApplicationEventFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :application_event, :string
  end
end
