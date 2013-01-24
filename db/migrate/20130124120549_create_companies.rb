class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :company_name
      t.string :type
      t.string :location
      t.integer :company_admin_id
     # t.references :company_admin
      t.timestamps
    end
  end
end
