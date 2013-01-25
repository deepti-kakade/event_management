class Company < ActiveRecord::Base
  belongs_to :company_admin
  has_many :users
  attr_accessible :company_admin_id, :company_name, :location, :type_of_company
end
