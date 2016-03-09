class Attendance < ActiveRecord::Base
  belongs_to :guest
  belongs_to :attendance_rate
  belongs_to :event
  validates :guest_id, :attendance_rate_id, presence: true
  #one guest can not have same event_id twice
  validates_uniqueness_of :guest_id, scope: :event_id
  def duepayment
  	attendance_rate.rate*event.event_group.service.gprice
  end
end
