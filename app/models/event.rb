class Event < ActiveRecord::Base
  belongs_to :room
  belongs_to :user
  belongs_to :event_group
  has_many :attendances, dependent: :destroy
  validates :user_id, presence: true
  accepts_nested_attributes_for :attendances, reject_if: proc { |attributes| attributes ['guest_id'].blank? }, allow_destroy: true
  def ends_at
  	starts_at + event_group.service.event_length*60
  end
  def to_s
  	starts_at
  end	
end
