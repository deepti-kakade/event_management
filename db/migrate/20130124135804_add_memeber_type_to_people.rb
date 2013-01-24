class AddMemeberTypeToPeople < ActiveRecord::Migration
  def change
    add_column :people, :member_type, :string
  end
end
