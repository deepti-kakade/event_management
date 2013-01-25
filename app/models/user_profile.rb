class UserProfile < ActiveRecord::Base
  belongs_to :user
  attr_accessible :address, :contact, :photo, :user_id
end
