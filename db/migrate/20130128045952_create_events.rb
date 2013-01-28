class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :event_name
      t.string :description
      t.string :status
      t.datetime :start_time
      t.datetime :end_time
      t.integer :user_id

      t.timestamps
    end
  end
end
