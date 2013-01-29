class AddImageToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :logo, :string
  end
end
