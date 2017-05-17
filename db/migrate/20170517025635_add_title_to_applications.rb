class AddTitleToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :title, :string
  end
end
