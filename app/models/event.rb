class Event < ActiveRecord::Base
  belongs_to :room
  belongs_to :user
  belongs_to :event_group
  validates :user_id, presence: true
  def ends_at
  	starts_at + duration*60
  end
  def to_s
  	starts_at
  end	
end
