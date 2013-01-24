class CompanyAdmin < Person

  has_one :company, :dependent => :destroy

  accepts_nested_attributes_for :company

  attr_accessible :first_name, :last_name, :company_attributes

end
