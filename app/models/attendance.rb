class Attendance < ActiveRecord::Base
  belongs_to :guest
  belongs_to :attendance_rate
  belongs_to :event
  validates :guest_id, presence: true
  def duepayment
	attendance_rate.rate*event.event_group.service.gprice
  end
end
