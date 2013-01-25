class User < Person
  has_one :user_profile, :dependent => :destroy
  belongs_to :company
  accepts_nested_attributes_for :user_profile
  attr_accessible :company_id, :first_name, :last_name, :user_profile_attributes
end
