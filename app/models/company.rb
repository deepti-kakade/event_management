class Company < ActiveRecord::Base
  belongs_to :company_admin
  attr_accessible :company_admin_id, :company_name, :location, :type_of_company
end
