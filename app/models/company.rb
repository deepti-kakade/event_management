class Company < ActiveRecord::Base
  mount_uploader :logo, PhotoUploader
  belongs_to :company_admin
  has_many :users
  has_many :events
  attr_accessible :company_admin_id, :company_name, :location, :type_of_company , :logo
  validates :company_name, presence: true

end
