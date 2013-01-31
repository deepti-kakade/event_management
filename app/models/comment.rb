class Comment < ActiveRecord::Base
  belongs_to :event
  has_many :users , :through => :events
  attr_accessible :content, :event_id, :parent_id
end
