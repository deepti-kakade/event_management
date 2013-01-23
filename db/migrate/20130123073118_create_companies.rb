class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :company_name
      t.string :address
      t.string :description
      t.string :logo

      t.timestamps
    end
  end
end
