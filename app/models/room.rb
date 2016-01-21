class Room < ActiveRecord::Base
  belongs_to :office
  has_many :events
  def to_s
    name
  end
end
