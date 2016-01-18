class Attendance < ActiveRecord::Base
  belongs_to :guest
  belongs_to :attendance_rate
  belongs_to :event
end
