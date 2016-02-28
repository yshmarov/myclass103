class Event < ActiveRecord::Base
  belongs_to :room
  belongs_to :user
  belongs_to :event_group
  has_many :attendances
  validates :user_id, :starts_at, :room_id, presence: true
  validates_time :starts_at, :between => '9:00am'..'8:00pm' #auto-creates a nested event & causes errors 

  accepts_nested_attributes_for :attendances, reject_if: proc { |attributes| attributes ['attendance_rate_id'].blank? }, allow_destroy: true
  def ends_at
  	starts_at + event_group.service.event_length*60
  end
  def to_s
  	starts_at
  end	
  def dueexpence
    event_group.service.uprice
  end
end
