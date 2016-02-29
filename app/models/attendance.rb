class Attendance < ActiveRecord::Base
  belongs_to :guest
  belongs_to :attendance_rate
  belongs_to :event
  validates :guest_id, :attendance_rate_id, presence: true
  #scope :on_user_events, lamda{ |user| joins(:event).where("events.user_id = ?", user.id) }

  def duepayment
	attendance_rate.rate*event.event_group.service.gprice
  end
end
