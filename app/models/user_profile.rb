class UserProfile < ActiveRecord::Base
  mount_on :photo
  belongs_to :user
  attr_accessible :address, :contact, :photo, :user_id
  validates :contact, presence: true
end
