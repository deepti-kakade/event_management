class Company < ActiveRecord::Base
  attr_accessible :address, :company_name, :description, :logo
end
