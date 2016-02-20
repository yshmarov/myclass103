class AttendanceRate < ActiveRecord::Base
  has_many :attendances
  def to_s
    name
  end
  validates :name, uniqueness: true, presence: true
  validates :rate, presence: true
  
end
