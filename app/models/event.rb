class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :company
  has_many :comments
  attr_accessible :description, :end_time, :event_name, :start_time, :status, :user_id , :company_id
end
