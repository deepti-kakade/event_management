class User < Person
  has_many :comments, :through => :events
  has_many :events, :dependent => :destroy
  has_one :user_profile, :dependent => :destroy
  belongs_to :company
  accepts_nested_attributes_for :user_profile
  attr_accessible :company_id, :first_name, :last_name, :user_profile_attributes
end
