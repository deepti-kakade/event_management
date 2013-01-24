class RenameColumnType < ActiveRecord::Migration
  def change
    rename_column :companies, :type, :type_of_company
  end

  def up
  end

  def down
  end
end
