class CreateCompanyAdmins < ActiveRecord::Migration
  def change
    create_table :company_admins do |t|
      t.string :comapny_name

      t.timestamps
    end
  end
end
