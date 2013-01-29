class UserProfile < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  attr_accessible :address, :contact, :photo, :user_id
  validates :contact, presence: true
end
