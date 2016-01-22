class Event < ActiveRecord::Base
  belongs_to :room
  belongs_to :user
  belongs_to :event_group
  has_many :attendances
  validates :user_id, presence: true
  accepts_nested_attributes_for :attendances, reject_if: proc { |attributes| attributes ['guest_id'].blank? }, allow_destroy: true
  def ends_at
  	starts_at + duration*60
  end
  def to_s
  	starts_at
  end	
end
