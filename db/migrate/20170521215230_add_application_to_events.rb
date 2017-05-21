class AddApplicationToEvents < ActiveRecord::Migration
  def change
    add_reference :events, :application, index: true, foreign_key: true
  end
end
