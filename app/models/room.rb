class Room < ActiveRecord::Base
  belongs_to :office
  has_many :events
  validates :name, :office_id, presence: true
  def to_s
    name
  end
end
