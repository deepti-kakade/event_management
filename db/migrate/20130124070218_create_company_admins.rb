class CreateCompanyAdmins < ActiveRecord::Migration
  def change
    create_table :company_admins do |t|

      t.timestamps
    end
  end
end
