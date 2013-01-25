class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.string :address
      t.string :contact
      t.string :photo

      t.timestamps
    end
  end
end
