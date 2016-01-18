class AttendanceRate < ActiveRecord::Base
  has_many :attendances
  def to_s
    name
  end
end
