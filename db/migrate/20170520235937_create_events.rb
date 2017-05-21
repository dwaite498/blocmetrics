class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :application_event

      t.timestamps null: false
    end
  end
end
