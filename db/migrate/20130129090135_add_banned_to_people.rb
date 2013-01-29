class AddBannedToPeople < ActiveRecord::Migration
  def change
    add_column :people, :banned, :boolean
  end
end
